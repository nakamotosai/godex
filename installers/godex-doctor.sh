#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
default_workspace="/home/ubuntu/codex"

resolve_path() {
  python3 - <<'PY' "$1"
import os
import sys

print(os.path.abspath(sys.argv[1]))
PY
}

if [[ $# -gt 0 ]]; then
  target_root="$(resolve_path "$1")"
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
  if [[ -f "$path" ]] && rg -q "$pattern" "$path"; then
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
check_file "bootstrap_prompt" "${repo_root}/prompts/bootstrap/GODEX_BOOTSTRAP.md"
check_file "doctor_doc" "${repo_root}/docs/DOCTOR.md"
check_file "benchmark_rubric" "${repo_root}/benchmarks/scoring-rubric.md"
check_file "benchmark_run_template" "${repo_root}/benchmarks/run-template.md"

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

check_file "workspace_agents" "${workspace_agents}"
check_pattern "workspace_godex_block" "## Godex Dogfood" "${workspace_agents}"
check_pattern "workspace_spec_escalation" "spec escalation" "${workspace_agents}"
check_pattern "workspace_native_multi_agent" "native multi-agent" "${workspace_agents}"
check_pattern "workspace_frontend_acceptance" "frontend-acceptance-gate" "${workspace_agents}"

printf '[overall] %s failures=%s workspace=%s\n' "${overall}" "${failures}" "${workspace_root}"
