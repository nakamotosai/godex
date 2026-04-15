#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
project_root="${1:-$(cd "${script_dir}/../.." && pwd)}"
doctor="${project_root}/.godex/bin/godex-doctor"
example_pack="${project_root}/.godex/examples/project-install-beta/README.md"

printf '[quick-proof] checking installed project surface\n'
"${doctor}" "${project_root}" || true

printf '[example_pack] %s\n' "${example_pack}"
printf '[next] compare your current repo behavior against the example pack above.\n'
