#!/usr/bin/env bash
set -euo pipefail

if [ "${1:-}" = "" ]; then
  echo "usage: $0 <base-dir>" >&2
  exit 1
fi

BASE_DIR="$(python3 - <<'PY' "$1"
import os, sys
print(os.path.abspath(sys.argv[1]))
PY
)"
SOURCE_DIR="$BASE_DIR/source"
VANILLA_DIR="$BASE_DIR/vanilla"
ENHANCED_DIR="$BASE_DIR/enhanced"

bash /home/ubuntu/codex/godex/benchmarks/scripts/materialize_round1.sh "$BASE_DIR"

init_repo() {
  local repo="$1"
  git -C "$repo" init -q
  git -C "$repo" config user.name "Godex Benchmark"
  git -C "$repo" config user.email "godex-benchmark@example.com"
  git -C "$repo" add .
  git -C "$repo" commit -q -m "chore: seed benchmark fixture"
}

copy_repo() {
  local src="$1"
  local dest="$2"
  cp -a "$src" "$dest"
}

task06() {
  local repo="$SOURCE_DIR/06-visual-layout-reporting"
  mkdir -p "$repo/config" "$repo/docs" "$repo/scripts"
  cat > "$repo/config/report-style.json" <<'EOF'
{
  "mirror_request_first": false,
  "default_optional_suggestions": true,
  "use_short_file_labels": false,
  "inline_changed_files": true,
  "inline_verification_commands": true
}
EOF
  cat > "$repo/README.md" <<'EOF'
# Report Style Fixture

Current terminal-facing closeouts:

- may start acting without restating the request
- may add optional extra suggestions by default
- often inline long changed-file lists
- often show full-path labels directly in the reply
- often dump raw verification commands instead of a readable summary

Verification docs:

- [behavior](docs/behavior.md)
- [terminal layout](docs/terminal-layout.md)
- [verification](docs/verification.md)
EOF
  cat > "$repo/docs/behavior.md" <<'EOF'
# Behavior

Current behavior docs are outdated and still describe these defaults:

- starts work without restating the request
- adds optional extra suggestions by default
- may inline long changed-file lists in the final report
EOF
  cat > "$repo/docs/terminal-layout.md" <<'EOF'
# Terminal Layout

Current terminal layout guidance still says:

- full file paths may be shown directly in the visible reply
- long changed-file lists may stay inline
- raw command lists are acceptable as the default verification style
EOF
  cat > "$repo/docs/verification.md" <<'EOF'
# Verification

Current verification guidance still allows:

- raw command walls as the default verification report
- no readable summary of which acceptance surfaces passed
EOF
  cat > "$repo/scripts/check_report_style.py" <<'EOF'
#!/usr/bin/env python3
import json
from pathlib import Path

cfg = json.loads(Path("config/report-style.json").read_text())
readme = Path("README.md").read_text()
behavior = Path("docs/behavior.md").read_text()
layout = Path("docs/terminal-layout.md").read_text()
verification = Path("docs/verification.md").read_text()

assert cfg["mirror_request_first"] is True
assert cfg["default_optional_suggestions"] is False
assert cfg["use_short_file_labels"] is True
assert cfg["inline_changed_files"] is False
assert cfg["inline_verification_commands"] is False

for phrase in [
    "mirrors the request before action",
    "does not add optional extra suggestions by default",
    "keeps changed files visible with short labels",
    "does not inline long changed-file lists by default",
    "summarizes verification surfaces before listing raw commands",
]:
    assert phrase in readme
    assert phrase in behavior
    assert phrase in layout
    assert phrase in verification

print("report style verified")
EOF
  cat > "$repo/scripts/check_report_docs.py" <<'EOF'
#!/usr/bin/env python3
from pathlib import Path

readme = Path("README.md").read_text()

for link in [
    "[behavior](docs/behavior.md)",
    "[terminal layout](docs/terminal-layout.md)",
    "[verification](docs/verification.md)",
]:
    assert link in readme

print("report docs linked")
EOF
  chmod +x "$repo/scripts/check_report_style.py" "$repo/scripts/check_report_docs.py"
  init_repo "$repo"
}

task06
copy_repo "$SOURCE_DIR/06-visual-layout-reporting" "$VANILLA_DIR/06-visual-layout-reporting"
copy_repo "$SOURCE_DIR/06-visual-layout-reporting" "$ENHANCED_DIR/06-visual-layout-reporting"

echo "materialized round3 benchmark fixtures under $BASE_DIR"
