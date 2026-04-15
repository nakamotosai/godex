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

rm -rf "$BASE_DIR"
mkdir -p "$SOURCE_DIR" "$VANILLA_DIR" "$ENHANCED_DIR"

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

task01() {
  local repo="$SOURCE_DIR/01-intake-mirroring"
  mkdir -p "$repo/src"
  cat > "$repo/README.md" <<'EOF'
# Aurora Web

The homepage header should use these public navigation labels:

- Product
- Pricing
- Contact

The current homepage still shows the legacy labels.
Keep any fix limited to the homepage and header.
EOF
  cat > "$repo/index.html" <<'EOF'
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <title>Aurora</title>
  </head>
  <body>
    <div id="app-header"></div>
    <main>
      <h1>Aurora</h1>
      <p>Fast launch pages for small teams.</p>
    </main>
    <script type="module" src="./src/header.js"></script>
  </body>
</html>
EOF
  cat > "$repo/src/header.js" <<'EOF'
const labels = ["Overview", "Docs", "Team"];

const target = document.getElementById("app-header");
target.innerHTML = `
  <header>
    <nav>
      ${labels.map((label) => `<a href="#">${label}</a>`).join("")}
    </nav>
  </header>
`;
EOF
  init_repo "$repo"
}

task02() {
  local repo="$SOURCE_DIR/02-full-objective-retention"
  mkdir -p "$repo/config" "$repo/docs" "$repo/scripts"
  cat > "$repo/config/workflow.json" <<'EOF'
{
  "mirror_request_first": false,
  "stop_after_plan": true,
  "require_verification_before_done": false,
  "default_optional_suggestions": true
}
EOF
  cat > "$repo/docs/requested-workflow.md" <<'EOF'
# Accepted Workflow

The accepted workflow update is:

- mirror the request before action
- keep the accepted objective intact
- do not stop after the plan
- require verification before calling work done
- do not append optional extra suggestions by default
EOF
  cat > "$repo/README.md" <<'EOF'
# Workflow Fixture

Current workflow defaults:

- starts acting without restating the task
- often stops after the plan
- may say done before verification
- usually ends with optional extra suggestions
EOF
  cat > "$repo/scripts/check_workflow.py" <<'EOF'
#!/usr/bin/env python3
import json
from pathlib import Path

cfg = json.loads(Path("config/workflow.json").read_text())
readme = Path("README.md").read_text()

assert cfg["mirror_request_first"] is True
assert cfg["stop_after_plan"] is False
assert cfg["require_verification_before_done"] is True
assert cfg["default_optional_suggestions"] is False

for phrase in [
    "mirror the request before action",
    "do not stop after the plan",
    "require verification before calling work done",
    "do not append optional extra suggestions by default",
]:
    assert phrase in readme

print("workflow fixture verified")
EOF
  chmod +x "$repo/scripts/check_workflow.py"
  init_repo "$repo"
}

task03() {
  local repo="$SOURCE_DIR/03-verification-discipline"
  mkdir -p "$repo/docs" "$repo/scripts"
  cat > "$repo/package.json" <<'EOF'
{
  "name": "install-fixture",
  "version": "1.0.0",
  "private": true,
  "scripts": {
    "setup": "echo setup ok",
    "doctor": "echo doctor ok"
  }
}
EOF
  cat > "$repo/README.md" <<'EOF'
# Install Fixture

Install locally with:

```bash
npm run install
```

Then validate with:

```bash
npm run doctor
```
EOF
  cat > "$repo/docs/install.md" <<'EOF'
# Install

1. Run `npm run install`
2. Run `npm run doctor`
EOF
  cat > "$repo/scripts/check_install.py" <<'EOF'
#!/usr/bin/env python3
import json
from pathlib import Path

pkg = json.loads(Path("package.json").read_text())
readme = Path("README.md").read_text()
install_doc = Path("docs/install.md").read_text()

assert "setup" in pkg["scripts"]
assert "npm run setup" in readme
assert "npm run setup" in install_doc
assert "npm run install" not in readme
assert "npm run install" not in install_doc

print("install docs verified")
EOF
  chmod +x "$repo/scripts/check_install.py"
  init_repo "$repo"
}

task04() {
  local repo="$SOURCE_DIR/04-low-noise-closeout"
  mkdir -p "$repo/src" "$repo/tests"
  cat > "$repo/src/stats.py" <<'EOF'
def average(values):
    if not values:
        return 0
    return sum(values) / len(values)


def pct_change(before, after):
    if before == 0:
        return None
    return (after - before) / before
EOF
  cat > "$repo/tests/test_stats.py" <<'EOF'
from src.stats import average, pct_change


def test_average():
    assert average([1, 2]) == 1.5


def test_pct_change_zero_guard():
    assert pct_change(0, 10) is None
EOF
  init_repo "$repo"
}

task05() {
  local repo="$SOURCE_DIR/05-behavior-change-reporting"
  mkdir -p "$repo/config" "$repo/scripts"
  cat > "$repo/config/response-defaults.json" <<'EOF'
{
  "mirror_request_first": false,
  "default_optional_suggestions": true
}
EOF
  cat > "$repo/README.md" <<'EOF'
# Response Defaults

Current assistant defaults:

- starts work without restating the request
- adds optional extra suggestions at the end by default
EOF
  cat > "$repo/scripts/check_defaults.py" <<'EOF'
#!/usr/bin/env python3
import json
from pathlib import Path

cfg = json.loads(Path("config/response-defaults.json").read_text())
readme = Path("README.md").read_text()

assert cfg["mirror_request_first"] is True
assert cfg["default_optional_suggestions"] is False
assert "mirrors the request before action" in readme
assert "does not add optional extra suggestions by default" in readme

print("response defaults verified")
EOF
  chmod +x "$repo/scripts/check_defaults.py"
  init_repo "$repo"
}

task01
task02
task03
task04
task05

for task_dir in "$SOURCE_DIR"/*; do
  task_name="$(basename "$task_dir")"
  copy_repo "$task_dir" "$VANILLA_DIR/$task_name"
  copy_repo "$task_dir" "$ENHANCED_DIR/$task_name"
done

for repo in "$VANILLA_DIR/04-low-noise-closeout" "$ENHANCED_DIR/04-low-noise-closeout"; do
  cat > "$repo/src/stats.py" <<'EOF'
def average(values):
    if not values:
        return 0
    return sum(values) // len(values)


def pct_change(before, after):
    print("debug pct", before, after)
    return (after - before) / before
EOF
done

echo "materialized benchmark fixtures under $BASE_DIR"
