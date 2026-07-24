#!/usr/bin/env bash
#
# split_h5.sh  --  split large .h5 files into <=49 MiB segments for GitHub.
#
# GitHub blocks pushes of files > 100 MiB and warns above 50 MiB, so any .h5
# larger than the segment size below is chopped into  <name>.h5.partNN  pieces
# and a  <name>.h5.sha256  checksum is written next to it. The original file is
# kept in place (it is git-ignored; only the parts + checksum are committed).
#
# Reassemble with  combine_h5.sh  (see that script / the README).
#
# Runs on the directory this script lives in, recursively. Copies of this script
# sit in models/ (handles every model) and in each individual model directory.
#
set -euo pipefail

SEG="49M"                                   # segment size (GNU split: M = MiB)
SEG_BYTES=$((49 * 1024 * 1024))
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

sha256() { command -v sha256sum >/dev/null 2>&1 && sha256sum "$1" | awk '{print $1}' || shasum -a 256 "$1" | awk '{print $1}'; }

echo "Scanning $SCRIPT_DIR for .h5 files larger than $SEG ..."
found=0
while IFS= read -r -d '' f; do
    # skip part files themselves
    case "$f" in *.part[0-9]*) continue;; esac
    size=$(stat -c%s "$f" 2>/dev/null || stat -f%z "$f")
    [ "$size" -gt "$SEG_BYTES" ] || continue
    found=1
    echo "  splitting $(basename "$f")  ($((size / 1024 / 1024)) MiB)"
    sha256 "$f" > "$f.sha256"
    rm -f "$f".part[0-9]*                    # clear any stale parts
    split -b "$SEG" -d "$f" "$f.part"
    n=$(ls "$f".part[0-9]* | wc -l)
    echo "    -> $n parts + $(basename "$f").sha256"
done < <(find "$SCRIPT_DIR" -type f -name '*.h5' -print0)

[ "$found" = 1 ] || echo "  nothing to split (no .h5 above $SEG)."
echo "Done."
