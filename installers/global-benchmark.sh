#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
codex_home="${1:-$(python3 - <<'PY'
from pathlib import Path
print(Path.home() / ".codex")
PY
)}"
doctor="${codex_home}/godex/bin/godex-doctor"
example_pack="${codex_home}/godex/examples/global-install-beta/README.md"
bootstrap_prompt="${codex_home}/godex/prompts/GODEX_BOOTSTRAP.md"

printf '[quick-proof] checking installed global surface\n'
"${doctor}" "${codex_home}" || true

printf '[example_pack] %s\n' "${example_pack}"
printf '[bootstrap_prompt] %s\n' "${bootstrap_prompt}"
printf '[next] compare one clean session against the example pack and prompt above.\n'
