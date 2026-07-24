#!/usr/bin/env bash
#
# combine_h5.sh  --  reassemble .h5 files that were split for GitHub.
#
# Large .h5 model files are shipped as  <name>.h5.partNN  pieces (each <=49 MiB)
# plus a  <name>.h5.sha256  checksum. This script concatenates the parts back
# into the original <name>.h5 and verifies the checksum.
#
# Run it once after cloning / downloading. Runs on the directory this script
# lives in, recursively. A copy sits in models/ (rebuilds every model) and in
# each individual model directory (rebuilds just that model).
#
#   ./combine_h5.sh          # rebuild any missing .h5 from its parts
#   ./combine_h5.sh --force  # rebuild even if the .h5 already exists
#
set -euo pipefail

FORCE=0
[ "${1:-}" = "--force" ] && FORCE=1
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

sha256() { command -v sha256sum >/dev/null 2>&1 && sha256sum "$1" | awk '{print $1}' || shasum -a 256 "$1" | awk '{print $1}'; }

echo "Scanning $SCRIPT_DIR for split .h5 files ..."
found=0
# each group is identified by its first part, <name>.h5.part00
while IFS= read -r -d '' first; do
    found=1
    base="${first%.part00}"                 # -> <name>.h5
    name="$(basename "$base")"
    if [ -f "$base" ] && [ "$FORCE" = 0 ]; then
        echo "  $name already exists (use --force to rebuild); skipping."
    else
        echo "  rebuilding $name from parts ..."
        cat "$base".part[0-9]* > "$base"
    fi
    if [ -f "$base.sha256" ]; then
        want="$(cat "$base.sha256")"
        got="$(sha256 "$base")"
        if [ "$want" = "$got" ]; then
            echo "    checksum OK"
        else
            echo "    ERROR: checksum mismatch for $name" >&2
            echo "      expected $want" >&2
            echo "      got      $got" >&2
            exit 1
        fi
    else
        echo "    (no .sha256 to verify against)"
    fi
done < <(find "$SCRIPT_DIR" -type f -name '*.h5.part00' -print0)

[ "$found" = 1 ] || echo "  nothing to combine (no *.part00 found)."
echo "Done."
