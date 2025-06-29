#!/usr/bin/env python3

import subprocess
import json
import re
import time
import argparse
import sys
from typing import List, Dict, Tuple

# Defaults
DEFAULT_REGISTRY = "docker://ghcr.io/vst-name/"
RETRIES = 3
RETRY_WAIT = 5
FEDORA_PATTERN = re.compile(r"\.fc\d{1,2}")
SIG_PATTERN = re.compile(r"^sha256-.*\.sig$")

# Helpers

def run_skopeo_inspect(registry: str, image: str, tag: str) -> Dict:
    """Fetch the manifest JSON for a given registry/image:tag using skopeo."""
    ref = f"{registry}{image}:{tag}"
    for attempt in range(1, RETRIES + 1):
        try:
            output = subprocess.run(
                ["skopeo", "inspect", ref],
                check=True,
                stdout=subprocess.PIPE,
            ).stdout
            return json.loads(output)
        except subprocess.CalledProcessError:
            if attempt < RETRIES:
                time.sleep(RETRY_WAIT)
            else:
                raise


def get_all_tags(registry: str, image: str) -> List[str]:
    """Retrieve all non-signature tags from the repository for a given image."""
    manifest = run_skopeo_inspect(registry, image, 'latest')
    tags = manifest.get('RepoTags', []) or []
    # filter out .0 suffix, signature manifests, and digests
    filtered = [t for t in tags
                if not t.endswith('.0')
                and not SIG_PATTERN.match(t)
                and not t.startswith('sha256-')]
    return sorted(filtered)


def select_two_latest(tags: List[str]) -> Tuple[str, str]:
    """Pick the two newest tags (sorted lexicographically)."""
    if len(tags) < 2:
        raise ValueError(f"Not enough tags to diff, found: {tags}")
    return tags[-2], tags[-1]


def extract_packages(info: Dict) -> Dict[str, str]:
    """Extract package-version mapping from manifest labels."""
    labels = info.get('Labels', {}) or {}
    data = labels.get('dev.hhd.rechunk.info')
    if not data:
        return {}
    packages = json.loads(data).get('packages', {})
    return {pkg: re.sub(FEDORA_PATTERN, '', ver) for pkg, ver in packages.items()}


def compare_versions(prev: Dict[str, str], curr: Dict[str, str]) -> str:
    """Generate markdown table rows for added, removed, and changed packages."""
    added = set(curr) - set(prev)
    removed = set(prev) - set(curr)
    changed = {pkg for pkg in prev.keys() & curr.keys() if prev[pkg] != curr[pkg]}

    lines = [
        "| Change | Package | Previous | Current |",
        "|---|---|---|---|"
    ]
    for pkg in sorted(added):
        lines.append(f"| ✨ Added | {pkg} |  | {curr[pkg]} |")
    for pkg in sorted(removed):
        lines.append(f"| ❌ Removed | {pkg} | {prev[pkg]} |  |")
    for pkg in sorted(changed):
        lines.append(f"| 🔄 Updated | {pkg} | {prev[pkg]} | {curr[pkg]} |")

    return '\n'.join(lines)


def main():
    parser = argparse.ArgumentParser(
        description="Generate a simple changelog for a UBlue image"
    )
    parser.add_argument(
        'image',
        help='Image name (e.g. ublue-aurora-dx)'
    )
    parser.add_argument(
        'output',
        nargs='?',
        default='-',
        help='Path to output Markdown file (use \'-\' or omit to print to stdout)'
    )
    parser.add_argument(
        '--registry',
        default=DEFAULT_REGISTRY,
        help=f"Registry prefix (default: {DEFAULT_REGISTRY})"
    )
    args = parser.parse_args()

    registry, image, output = args.registry, args.image, args.output

    # 1. Get tags and pick the latest two
    tags = get_all_tags(registry, image)
    if args.output != "-":
        print(f"Found tags: {tags}")

    prev_tag, curr_tag = select_two_latest(tags)

    # 2. Fetch manifests
    prev_manifest = run_skopeo_inspect(registry, image, prev_tag)
    curr_manifest = run_skopeo_inspect(registry, image, curr_tag)

    # 3. Extract package lists
    prev_pkgs = extract_packages(prev_manifest)
    curr_pkgs = extract_packages(curr_manifest)

    # 4. Build diff markdown
    diff_md = compare_versions(prev_pkgs, curr_pkgs)

    # 5. Assemble full changelog
    header = f"# Changelog for {image}:{curr_tag}\n"
    header += f"Based on previous release: {prev_tag}\n\n"
    changelog = header + diff_md + "\n"

    # 6. Output
    if output == '-':
        sys.stdout.write(changelog)
    else:
        with open(output, 'w') as f:
            f.write(changelog)
        print(f"Changelog written to {output}")

if __name__ == '__main__':
    main()
