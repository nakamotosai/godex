#!/usr/bin/env bash
set -euo pipefail

START_MARKER="<!-- GODEX GLOBAL BLOCK START -->"
END_MARKER="<!-- GODEX GLOBAL BLOCK END -->"

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
target_home="$(python3 - <<'PY' "${1:-~/.codex}"
import os
import sys

print(os.path.abspath(os.path.expanduser(sys.argv[1])))
PY
)"

mkdir -p "${target_home}"

agents_path="${target_home}/AGENTS.md"
godex_dir="${target_home}/godex"
bin_dir="${godex_dir}/bin"
backups_dir="${godex_dir}/backups"
docs_dir="${godex_dir}/docs"
examples_dir="${godex_dir}/examples/global-install-beta"
prompts_dir="${godex_dir}/prompts"
manifest_path="${godex_dir}/manifest.json"

mkdir -p "${bin_dir}" "${backups_dir}" "${docs_dir}" "${examples_dir}" "${prompts_dir}"

render_block() {
  cat <<'EOF'
<!-- GODEX GLOBAL BLOCK START -->
## godex Global Policy

- First reply briefly mirrors the task before action.
- Keep the accepted full objective intact. Do not silently collapse it into a "smallest next step" handoff.
- Verify before calling work done.
- Report behavior change before code churn.
- Final replies default to result, verification, and real boundary.
- Keep closeouts low-noise and visually readable.
- Separate dense blocks with blank lines.
- In review outputs, paragraph-length findings must be separated into distinct blocks with blank lines.
- Do not stack long review findings inside a dense numbered list.
- Avoid path walls, command walls, and artifact walls.
<!-- GODEX GLOBAL BLOCK END -->
EOF
}

start_count=0
end_count=0
if [[ -f "${agents_path}" ]]; then
  start_count="$(python3 - <<'PY' "${agents_path}" "${START_MARKER}"
from pathlib import Path
import sys

print(Path(sys.argv[1]).read_text().count(sys.argv[2]))
PY
)"
  end_count="$(python3 - <<'PY' "${agents_path}" "${END_MARKER}"
from pathlib import Path
import sys

print(Path(sys.argv[1]).read_text().count(sys.argv[2]))
PY
)"
fi

if [[ "${start_count}" != "${end_count}" || "${start_count}" -gt 1 ]]; then
  echo "[error] existing AGENTS.md has conflicted godex global markers: ${agents_path}" >&2
  exit 2
fi

timestamp="$(date -u +%Y%m%d-%H%M%S)"
agents_mode="created"
agents_backup=""
existing_manifest_backup=""

if [[ -f "${manifest_path}" ]]; then
  existing_manifest_backup="$(python3 - <<'PY' "${manifest_path}"
import json
import sys
from pathlib import Path

path = Path(sys.argv[1])
try:
    manifest = json.loads(path.read_text())
except json.JSONDecodeError:
    manifest = {}
print(manifest.get("agents_backup") or "")
PY
)"
fi

if [[ -f "${agents_path}" ]]; then
  if [[ "${start_count}" -eq 1 ]]; then
    agents_mode="replaced"
    if [[ -n "${existing_manifest_backup}" && -f "${target_home}/${existing_manifest_backup}" ]]; then
      agents_backup="${existing_manifest_backup}"
      cp "${agents_path}" "${target_home}/godex/backups/AGENTS.md.pre-upgrade-${timestamp}.bak"
    else
      agents_backup="godex/backups/AGENTS.md.pre-godex-${timestamp}.bak"
      cp "${agents_path}" "${target_home}/${agents_backup}"
    fi
    python3 - <<'PY' "${agents_path}" "${START_MARKER}" "${END_MARKER}"
from pathlib import Path
import sys

path = Path(sys.argv[1])
start = sys.argv[2]
end = sys.argv[3]
text = path.read_text()
block = """<!-- GODEX GLOBAL BLOCK START -->
## godex Global Policy

- First reply briefly mirrors the task before action.
- Keep the accepted full objective intact. Do not silently collapse it into a "smallest next step" handoff.
- Verify before calling work done.
- Report behavior change before code churn.
- Final replies default to result, verification, and real boundary.
- Keep closeouts low-noise and visually readable.
- Separate dense blocks with blank lines.
- In review outputs, paragraph-length findings must be separated into distinct blocks with blank lines.
- Do not stack long review findings inside a dense numbered list.
- Avoid path walls, command walls, and artifact walls.
<!-- GODEX GLOBAL BLOCK END -->"""
start_idx = text.index(start)
end_idx = text.index(end) + len(end)
updated = text[:start_idx].rstrip() + "\n\n" + block + text[end_idx:]
updated = updated.strip() + "\n"
path.write_text(updated)
PY
  else
    agents_mode="appended"
    agents_backup="godex/backups/AGENTS.md.pre-godex-${timestamp}.bak"
    cp "${agents_path}" "${target_home}/${agents_backup}"
    {
      printf '\n'
      render_block
      printf '\n'
    } >> "${agents_path}"
  fi
else
  render_block > "${agents_path}"
fi

cp "${repo_root}/installers/global-doctor.py" "${bin_dir}/godex-doctor"
cp "${repo_root}/installers/global-restore.py" "${bin_dir}/godex-restore"
cp "${repo_root}/installers/global-benchmark.sh" "${bin_dir}/godex-benchmark"
cp "${repo_root}/docs/GLOBAL_INSTALL.md" "${docs_dir}/GLOBAL_INSTALL.md"
cp "${repo_root}/prompts/bootstrap/GODEX_BOOTSTRAP.md" "${prompts_dir}/GODEX_BOOTSTRAP.md"
rm -rf "${examples_dir}"
mkdir -p "${examples_dir}"
cp -R "${repo_root}/examples/global-install-beta/." "${examples_dir}/"

chmod +x "${bin_dir}/godex-doctor" "${bin_dir}/godex-restore" "${bin_dir}/godex-benchmark"

source_version="$(git -C "${repo_root}" rev-parse --short HEAD 2>/dev/null || printf 'unknown')"
installed_at="$(date -u +%Y-%m-%dT%H:%M:%SZ)"

python3 - <<'PY' "${agents_path}" "${manifest_path}" "${agents_mode}" "${agents_backup}" "${source_version}" "${installed_at}"
import hashlib
import json
import sys
from pathlib import Path

agents_path = Path(sys.argv[1])
manifest_path = Path(sys.argv[2])
agents_mode = sys.argv[3]
agents_backup = sys.argv[4]
source_version = sys.argv[5]
installed_at = sys.argv[6]
start = "<!-- GODEX GLOBAL BLOCK START -->"
end = "<!-- GODEX GLOBAL BLOCK END -->"
text = agents_path.read_text()
block = text[text.index(start) : text.index(end) + len(end)]
manifest = {
    "schema_version": 1,
    "install_mode": "global",
    "installed_at": installed_at,
    "source_version": source_version,
    "agents_mode": agents_mode,
    "agents_backup": agents_backup or None,
    "agents_block_sha256": hashlib.sha256(block.encode("utf-8")).hexdigest(),
    "managed_files": [
        "AGENTS.md",
        "godex/bin/godex-doctor",
        "godex/bin/godex-restore",
        "godex/bin/godex-benchmark",
        "godex/docs/GLOBAL_INSTALL.md",
        "godex/prompts/GODEX_BOOTSTRAP.md",
        "godex/examples/global-install-beta/README.md",
        "godex/examples/global-install-beta/review-layout-example.md",
    ],
}
manifest_path.write_text(json.dumps(manifest, indent=2) + "\n")
PY

printf '[install] healthy %s\n' "${target_home}"
printf '[agents_mode] %s %s\n' "${agents_mode}" "${agents_path}"
if [[ -n "${agents_backup}" ]]; then
  printf '[backup] healthy %s\n' "${target_home}/${agents_backup}"
fi
printf '[manifest] healthy %s\n' "${manifest_path}"
printf '[next] %s\n' "${bin_dir}/godex-doctor"
printf '[next] %s\n' "${bin_dir}/godex-benchmark"
