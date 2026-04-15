#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
default_workspace="/home/ubuntu/codex"
repo_only=0
target_arg=""

while [[ $# -gt 0 ]]; do
  case "$1" in
    --repo-only)
      repo_only=1
      shift
      ;;
    *)
      target_arg="$1"
      shift
      ;;
  esac
done

resolve_path() {
  python3 - <<'PY' "$1"
import os
import sys

print(os.path.abspath(sys.argv[1]))
PY
}

if [[ -n "${target_arg}" ]]; then
  target_root="$(resolve_path "${target_arg}")"
  if [[ "${target_root}" != "${default_workspace}" && "${target_root}" != "${repo_root}" ]]; then
    exec "${repo_root}/installers/project-doctor.py" "${target_root}"
  fi
  if [[ "${target_root}" = "${repo_root}" ]]; then
    workspace_root="${default_workspace}"
  else
    workspace_root="${target_root}"
  fi
else
  workspace_root="${default_workspace}"
fi

workspace_agents="${workspace_root}/AGENTS.md"

overall="healthy"
failures=0

check_file() {
  local label="$1"
  local path="$2"
  if [[ -f "$path" ]]; then
    printf '[%s] healthy %s\n' "$label" "$path"
  else
    printf '[%s] missing %s\n' "$label" "$path"
    overall="partial"
    failures=$((failures + 1))
  fi
}

check_pattern() {
  local label="$1"
  local pattern="$2"
  local path="$3"
  local found=1
  if [[ -f "$path" ]]; then
    if command -v rg >/dev/null 2>&1; then
      if rg -q "$pattern" "$path"; then
        found=0
      fi
    else
      if grep -q "$pattern" "$path"; then
        found=0
      fi
    fi
  fi
  if [[ -f "$path" && "${found}" -eq 0 ]]; then
    printf '[%s] healthy %s\n' "$label" "$path"
  else
    printf '[%s] missing %s\n' "$label" "$path"
    overall="partial"
    failures=$((failures + 1))
  fi
}

check_file "repo_readme" "${repo_root}/README.md"
check_file "repo_agents" "${repo_root}/AGENTS.md"
check_file "dogfood_spec" "${repo_root}/specs/dogfood-rollout-20260415/SPEC.md"
check_file "dogfood_plan" "${repo_root}/specs/dogfood-rollout-20260415/PLAN.md"
check_file "release_closeout_spec" "${repo_root}/specs/release-closeout-20260415/SPEC.md"
check_file "release_closeout_plan" "${repo_root}/specs/release-closeout-20260415/PLAN.md"
check_file "bootstrap_prompt" "${repo_root}/prompts/bootstrap/GODEX_BOOTSTRAP.md"
check_file "doctor_doc" "${repo_root}/docs/DOCTOR.md"
check_file "global_install_doc" "${repo_root}/docs/GLOBAL_INSTALL.md"
check_file "project_install_doc" "${repo_root}/docs/PROJECT_INSTALL.md"
check_file "support_matrix_doc" "${repo_root}/docs/SUPPORT_MATRIX.md"
check_file "manual_merge_doc" "${repo_root}/docs/MANUAL_MERGE.md"
check_file "troubleshooting_doc" "${repo_root}/docs/TROUBLESHOOTING.md"
check_file "upgrade_doc" "${repo_root}/docs/UPGRADE.md"
check_file "contributing_doc" "${repo_root}/CONTRIBUTING.md"
check_file "benchmark_rubric" "${repo_root}/benchmarks/scoring-rubric.md"
check_file "benchmark_run_template" "${repo_root}/benchmarks/run-template.md"
check_file "project_install_script" "${repo_root}/installers/install-project.sh"
check_file "project_restore_script" "${repo_root}/installers/project-restore.py"
check_file "project_benchmark_script" "${repo_root}/installers/project-benchmark.sh"
check_file "global_install_script" "${repo_root}/installers/install-global.sh"
check_file "global_doctor_script" "${repo_root}/installers/global-doctor.py"
check_file "global_restore_script" "${repo_root}/installers/global-restore.py"
check_file "global_benchmark_script" "${repo_root}/installers/global-benchmark.sh"
check_file "agents_preflight_script" "${repo_root}/installers/agents_preflight.py"
check_file "install_proof_script" "${repo_root}/benchmarks/scripts/verify_install_surfaces.sh"
check_file "release_pack" "${repo_root}/releases/project-first-beta-20260415/README.md"
check_file "v1_release_pack" "${repo_root}/releases/v1.0.1/README.md"
check_file "changelog" "${repo_root}/CHANGELOG.md"
check_file "ci_workflow" "${repo_root}/.github/workflows/ci.yml"
check_file "install_issue_template" "${repo_root}/.github/ISSUE_TEMPLATE/install-failure.yml"
check_file "product_bug_template" "${repo_root}/.github/ISSUE_TEMPLATE/product-bug.yml"

task_count=0
if [[ -d "${repo_root}/benchmarks/tasks" ]]; then
  task_count="$(find "${repo_root}/benchmarks/tasks" -maxdepth 1 -type f | wc -l | tr -d ' ')"
fi
if [[ "${task_count}" -ge 5 ]]; then
  printf '[benchmark_tasks] healthy %s tasks=%s\n' "${repo_root}/benchmarks/tasks" "${task_count}"
else
  printf '[benchmark_tasks] missing %s tasks=%s\n' "${repo_root}/benchmarks/tasks" "${task_count}"
  overall="partial"
  failures=$((failures + 1))
fi

if [[ "${repo_only}" -eq 0 ]]; then
  check_file "workspace_agents" "${workspace_agents}"
  check_pattern "workspace_godex_block" "## Godex Dogfood" "${workspace_agents}"
  check_pattern "workspace_spec_escalation" "spec escalation" "${workspace_agents}"
  check_pattern "workspace_native_multi_agent" "native multi-agent" "${workspace_agents}"
  check_pattern "workspace_frontend_acceptance" "frontend-acceptance-gate" "${workspace_agents}"
fi

if [[ "${repo_only}" -eq 1 ]]; then
  printf '[overall] %s failures=%s repo=%s\n' "${overall}" "${failures}" "${repo_root}"
else
  printf '[overall] %s failures=%s workspace=%s\n' "${overall}" "${failures}" "${workspace_root}"
fi
