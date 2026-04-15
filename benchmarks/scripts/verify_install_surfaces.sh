#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
artifact_root="${1:-$(mktemp -d /tmp/godex-install-proof-XXXXXX)}"

mkdir -p "${artifact_root}"

run_expect() {
  local expected="$1"
  local outfile="$2"
  shift 2
  set +e
  "$@" >"${outfile}" 2>&1
  local status=$?
  set -e
  if [[ "${status}" -ne "${expected}" ]]; then
    echo "unexpected exit: expected=${expected} actual=${status} cmd=$*" >&2
    cat "${outfile}" >&2
    exit 1
  fi
}

assert_contains() {
  local needle="$1"
  local file="$2"
  if command -v rg >/dev/null 2>&1; then
    if rg -Fq "${needle}" "${file}"; then
      return 0
    fi
  else
    if grep -Fq "${needle}" "${file}"; then
      return 0
    fi
  fi
  echo "missing expected text: ${needle} in ${file}" >&2
  cat "${file}" >&2
  exit 1
}

project_root="${artifact_root}/project"
global_root="${artifact_root}/global"

mkdir -p "${project_root}/clean" "${project_root}/simple" "${project_root}/complex" "${project_root}/drift" "${project_root}/partial" "${project_root}/conflicted"
mkdir -p "${global_root}/clean-home" "${global_root}/simple-home" "${global_root}/complex-home" "${global_root}/drift-home" "${global_root}/partial-home" "${global_root}/conflicted-home"

git -C "${project_root}/clean" init -q
git -C "${project_root}/simple" init -q
git -C "${project_root}/complex" init -q
git -C "${project_root}/drift" init -q
git -C "${project_root}/partial" init -q
git -C "${project_root}/conflicted" init -q

printf '## Existing Policy\n\n- Keep changelog synced.\n' >"${project_root}/simple/AGENTS.md"
cp "${project_root}/simple/AGENTS.md" "${project_root}/simple/original-agents.md"
cat >"${project_root}/complex/AGENTS.md" <<'EOF'
# Existing Repo Rules

## Build

- Keep release docs aligned.
- Run targeted tests before merge.

## Deploy

1. Review staging config.
2. Confirm production rollback.

Custom note:
This repo already carries a fuller local instruction stack.
EOF

run_expect 1 "${artifact_root}/project-missing.txt" "${repo_root}/installers/project-doctor.py" "${project_root}/clean"
assert_contains "[overall] missing" "${artifact_root}/project-missing.txt"

run_expect 0 "${artifact_root}/project-clean-dry-run.txt" bash "${repo_root}/installers/install-project.sh" --dry-run "${project_root}/clean"
assert_contains "[preflight] ready_create" "${artifact_root}/project-clean-dry-run.txt"
assert_contains "[dry_run] no files changed" "${artifact_root}/project-clean-dry-run.txt"
[[ ! -e "${project_root}/clean/.godex" ]]

run_expect 0 "${artifact_root}/project-clean-install.txt" bash "${repo_root}/installers/install-project.sh" "${project_root}/clean"
run_expect 0 "${artifact_root}/project-clean-healthy.txt" "${project_root}/clean/.godex/bin/godex-doctor" "${project_root}/clean"
run_expect 0 "${artifact_root}/project-clean-benchmark.txt" "${project_root}/clean/.godex/bin/godex-benchmark" "${project_root}/clean"
assert_contains "[overall] healthy" "${artifact_root}/project-clean-healthy.txt"

run_expect 0 "${artifact_root}/project-simple-dry-run.txt" bash "${repo_root}/installers/install-project.sh" --dry-run "${project_root}/simple"
assert_contains "[preflight] ready_append" "${artifact_root}/project-simple-dry-run.txt"
assert_contains "[dry_run] no files changed" "${artifact_root}/project-simple-dry-run.txt"

run_expect 0 "${artifact_root}/project-simple-install.txt" bash "${repo_root}/installers/install-project.sh" "${project_root}/simple"
run_expect 0 "${artifact_root}/project-simple-reinstall.txt" bash "${repo_root}/installers/install-project.sh" "${project_root}/simple"
run_expect 0 "${artifact_root}/project-simple-restore.txt" "${project_root}/simple/.godex/bin/godex-restore" "${project_root}/simple"
if ! cmp -s "${project_root}/simple/original-agents.md" "${project_root}/simple/AGENTS.md"; then
  echo "project restore did not recover original AGENTS.md" >&2
  exit 1
fi

run_expect 3 "${artifact_root}/project-complex-dry-run.txt" bash "${repo_root}/installers/install-project.sh" --dry-run "${project_root}/complex"
assert_contains "[preflight] manual_review" "${artifact_root}/project-complex-dry-run.txt"
assert_contains "docs/MANUAL_MERGE.md" "${artifact_root}/project-complex-dry-run.txt"
run_expect 3 "${artifact_root}/project-complex-install.txt" bash "${repo_root}/installers/install-project.sh" "${project_root}/complex"
assert_contains "[preflight] manual_review" "${artifact_root}/project-complex-install.txt"
[[ ! -e "${project_root}/complex/.godex" ]]

run_expect 0 "${artifact_root}/project-drift-install.txt" bash "${repo_root}/installers/install-project.sh" "${project_root}/drift"
rm "${project_root}/drift/.godex/bin/godex-benchmark"
run_expect 1 "${artifact_root}/project-drift.txt" "${project_root}/drift/.godex/bin/godex-doctor" "${project_root}/drift"
assert_contains "[overall] drifted" "${artifact_root}/project-drift.txt"

run_expect 0 "${artifact_root}/project-partial-install.txt" bash "${repo_root}/installers/install-project.sh" "${project_root}/partial"
rm "${project_root}/partial/.godex/manifest.json"
run_expect 1 "${artifact_root}/project-partial.txt" "${project_root}/partial/.godex/bin/godex-doctor" "${project_root}/partial"
assert_contains "[overall] partial" "${artifact_root}/project-partial.txt"

run_expect 0 "${artifact_root}/project-conflicted-install.txt" bash "${repo_root}/installers/install-project.sh" "${project_root}/conflicted"
python3 - <<'PY' "${project_root}/conflicted/AGENTS.md"
from pathlib import Path
import sys

path = Path(sys.argv[1])
path.write_text(path.read_text().replace('<!-- GODEX PROJECT BLOCK END -->', ''))
PY
run_expect 1 "${artifact_root}/project-conflicted.txt" "${project_root}/conflicted/.godex/bin/godex-doctor" "${project_root}/conflicted"
assert_contains "[overall] conflicted" "${artifact_root}/project-conflicted.txt"

run_expect 1 "${artifact_root}/project-unsupported.txt" "${repo_root}/installers/project-doctor.py" "${project_root}/missing-root"
assert_contains "[overall] unsupported" "${artifact_root}/project-unsupported.txt"

printf '## Existing Global Policy\n\n- Keep provider config explicit.\n' >"${global_root}/simple-home/AGENTS.md"
cp "${global_root}/simple-home/AGENTS.md" "${global_root}/simple-home/original-agents.md"
cat >"${global_root}/complex-home/AGENTS.md" <<'EOF'
# Existing Global Rules

## Models

- Keep provider routing explicit.
- Avoid silent auth fallbacks.

## Runtime

1. Prefer local auditability.
2. Keep safety rules documented.

Custom note:
This Codex home already carries a complex instruction stack.
EOF

run_expect 1 "${artifact_root}/global-missing.txt" "${repo_root}/installers/global-doctor.py" "${global_root}/clean-home"
assert_contains "[overall] missing" "${artifact_root}/global-missing.txt"

run_expect 0 "${artifact_root}/global-fresh-dry-run.txt" bash "${repo_root}/installers/install-global.sh" --dry-run "${global_root}/fresh-home"
assert_contains "[preflight] ready_create" "${artifact_root}/global-fresh-dry-run.txt"
assert_contains "[dry_run] no files changed" "${artifact_root}/global-fresh-dry-run.txt"
[[ ! -e "${global_root}/fresh-home" ]]

run_expect 0 "${artifact_root}/global-clean-dry-run.txt" bash "${repo_root}/installers/install-global.sh" --dry-run "${global_root}/clean-home"
assert_contains "[preflight] ready_create" "${artifact_root}/global-clean-dry-run.txt"
assert_contains "[dry_run] no files changed" "${artifact_root}/global-clean-dry-run.txt"
[[ ! -e "${global_root}/clean-home/godex" ]]

run_expect 0 "${artifact_root}/global-fresh-install.txt" bash "${repo_root}/installers/install-global.sh" "${global_root}/fresh-home"
run_expect 0 "${artifact_root}/global-fresh-healthy.txt" "${global_root}/fresh-home/godex/bin/godex-doctor" "${global_root}/fresh-home"
assert_contains "[overall] healthy" "${artifact_root}/global-fresh-healthy.txt"

run_expect 0 "${artifact_root}/global-clean-install.txt" bash "${repo_root}/installers/install-global.sh" "${global_root}/clean-home"
run_expect 0 "${artifact_root}/global-clean-healthy.txt" "${global_root}/clean-home/godex/bin/godex-doctor" "${global_root}/clean-home"
run_expect 0 "${artifact_root}/global-clean-benchmark.txt" "${global_root}/clean-home/godex/bin/godex-benchmark" "${global_root}/clean-home"
assert_contains "[overall] healthy" "${artifact_root}/global-clean-healthy.txt"

run_expect 0 "${artifact_root}/global-simple-dry-run.txt" bash "${repo_root}/installers/install-global.sh" --dry-run "${global_root}/simple-home"
assert_contains "[preflight] ready_append" "${artifact_root}/global-simple-dry-run.txt"
assert_contains "[dry_run] no files changed" "${artifact_root}/global-simple-dry-run.txt"

run_expect 0 "${artifact_root}/global-simple-install.txt" bash "${repo_root}/installers/install-global.sh" "${global_root}/simple-home"
run_expect 0 "${artifact_root}/global-simple-reinstall.txt" bash "${repo_root}/installers/install-global.sh" "${global_root}/simple-home"
run_expect 0 "${artifact_root}/global-simple-restore.txt" "${global_root}/simple-home/godex/bin/godex-restore" "${global_root}/simple-home"
if ! cmp -s "${global_root}/simple-home/original-agents.md" "${global_root}/simple-home/AGENTS.md"; then
  echo "global restore did not recover original AGENTS.md" >&2
  exit 1
fi

run_expect 3 "${artifact_root}/global-complex-dry-run.txt" bash "${repo_root}/installers/install-global.sh" --dry-run "${global_root}/complex-home"
assert_contains "[preflight] manual_review" "${artifact_root}/global-complex-dry-run.txt"
assert_contains "docs/MANUAL_MERGE.md" "${artifact_root}/global-complex-dry-run.txt"
run_expect 3 "${artifact_root}/global-complex-install.txt" bash "${repo_root}/installers/install-global.sh" "${global_root}/complex-home"
assert_contains "[preflight] manual_review" "${artifact_root}/global-complex-install.txt"
[[ ! -e "${global_root}/complex-home/godex" ]]

run_expect 0 "${artifact_root}/global-drift-install.txt" bash "${repo_root}/installers/install-global.sh" "${global_root}/drift-home"
rm "${global_root}/drift-home/godex/bin/godex-benchmark"
run_expect 1 "${artifact_root}/global-drift.txt" "${global_root}/drift-home/godex/bin/godex-doctor" "${global_root}/drift-home"
assert_contains "[overall] drifted" "${artifact_root}/global-drift.txt"

run_expect 0 "${artifact_root}/global-partial-install.txt" bash "${repo_root}/installers/install-global.sh" "${global_root}/partial-home"
rm "${global_root}/partial-home/godex/manifest.json"
run_expect 1 "${artifact_root}/global-partial.txt" "${repo_root}/installers/global-doctor.py" "${global_root}/partial-home"
assert_contains "[overall] partial" "${artifact_root}/global-partial.txt"

run_expect 0 "${artifact_root}/global-conflicted-install.txt" bash "${repo_root}/installers/install-global.sh" "${global_root}/conflicted-home"
python3 - <<'PY' "${global_root}/conflicted-home/AGENTS.md"
from pathlib import Path
import sys

path = Path(sys.argv[1])
path.write_text(path.read_text().replace('<!-- GODEX GLOBAL BLOCK END -->', ''))
PY
run_expect 1 "${artifact_root}/global-conflicted.txt" "${repo_root}/installers/global-doctor.py" "${global_root}/conflicted-home"
assert_contains "[overall] conflicted" "${artifact_root}/global-conflicted.txt"

run_expect 1 "${artifact_root}/global-unsupported.txt" "${repo_root}/installers/global-doctor.py" "${global_root}/missing-home"
assert_contains "[overall] unsupported" "${artifact_root}/global-unsupported.txt"

printf '[artifact_root] %s\n' "${artifact_root}"
printf '[ok] project install verified on isolated clean, dry-run, additive, and manual-review targets\n'
printf '[ok] project doctor states verified: missing healthy partial drifted conflicted unsupported\n'
printf '[ok] global install verified on isolated missing-target, clean, dry-run, additive, and manual-review Codex-home targets\n'
printf '[ok] global doctor states verified: missing healthy partial drifted conflicted unsupported\n'
printf '[ok] project/global benchmark and restore paths verified\n'
