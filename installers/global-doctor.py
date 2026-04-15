#!/usr/bin/env python3
from __future__ import annotations

import argparse
import hashlib
import json
from pathlib import Path

START_MARKER = "<!-- GODEX GLOBAL BLOCK START -->"
END_MARKER = "<!-- GODEX GLOBAL BLOCK END -->"
SUPPORTED_SCHEMA = 1
SUPPORTED_MODE = "global"


def default_codex_home() -> Path:
    return Path.home() / ".codex"


def print_check(label: str, status: str, detail: str) -> None:
    print(f"[{label}] {status} {detail}")


def sha256_text(text: str) -> str:
    return hashlib.sha256(text.encode("utf-8")).hexdigest()


def extract_block(text: str) -> str | None:
    if START_MARKER not in text or END_MARKER not in text:
        return None
    start = text.index(START_MARKER)
    end = text.index(END_MARKER) + len(END_MARKER)
    return text[start:end]


def classify_codex_home(root: Path) -> int:
    agents_path = root / "AGENTS.md"
    godex_dir = root / "godex"
    manifest_path = godex_dir / "manifest.json"

    if not root.is_dir():
        print_check("codex_home", "unsupported", str(root))
        print("[overall] unsupported codex home does not exist or is not a directory")
        print("[next] choose an existing Codex home and rerun doctor")
        return 1

    agents_text = ""
    start_count = 0
    end_count = 0
    if agents_path.is_file():
        agents_text = agents_path.read_text()
        start_count = agents_text.count(START_MARKER)
        end_count = agents_text.count(END_MARKER)

    install_traces = godex_dir.exists() or start_count > 0 or end_count > 0
    if not install_traces:
        print_check("codex_home", "healthy", str(root))
        print("[overall] missing no godex global install traces found")
        print("[next] run the global installer for this Codex home")
        return 1

    if (start_count == 0) != (end_count == 0) or start_count > 1 or end_count > 1:
        print_check("agents_markers", "conflicted", str(agents_path))
        print("[overall] conflicted AGENTS markers are missing, duplicated, or mismatched")
        print("[next] fix the Codex-home AGENTS.md markers manually before reinstalling")
        return 1

    if not manifest_path.is_file():
        print_check("manifest", "missing", str(manifest_path))
        print("[overall] partial godex traces exist but manifest.json is missing")
        print("[next] reinstall the global layer to recreate the manifest")
        return 1

    try:
        manifest = json.loads(manifest_path.read_text())
    except json.JSONDecodeError:
        print_check("manifest", "drifted", str(manifest_path))
        print("[overall] drifted manifest.json exists but no longer parses")
        print("[next] run godex-restore if available, then reinstall")
        return 1

    schema_version = manifest.get("schema_version")
    install_mode = manifest.get("install_mode")
    if schema_version != SUPPORTED_SCHEMA or install_mode != SUPPORTED_MODE:
        print_check("manifest_version", "unsupported", str(manifest_path))
        print(
            f"[overall] unsupported schema_version={schema_version!r} install_mode={install_mode!r}"
        )
        print("[next] use a matching godex version or perform a manual review")
        return 1

    managed_files = manifest.get("managed_files")
    if not isinstance(managed_files, list) or not managed_files:
        print_check("managed_files", "partial", str(manifest_path))
        print("[overall] partial manifest.json is missing a usable managed_files list")
        print("[next] reinstall the global layer to regenerate the manifest")
        return 1

    print_check("codex_home", "healthy", str(root))
    print_check("manifest", "healthy", str(manifest_path))

    final_status = "healthy"

    block = extract_block(agents_text) if agents_text else None
    expected_hash = manifest.get("agents_block_sha256")
    if not agents_path.is_file():
        print_check("agents_file", "drifted", str(agents_path))
        final_status = "drifted"
    elif block is None:
        print_check("agents_block", "drifted", str(agents_path))
        final_status = "drifted"
    elif not expected_hash or sha256_text(block) != expected_hash:
        print_check("agents_block", "drifted", str(agents_path))
        final_status = "drifted"
    else:
        print_check("agents_block", "healthy", str(agents_path))

    backup_path = manifest.get("agents_backup")
    if backup_path:
        backup_file = root / backup_path
        if backup_file.is_file():
            print_check("agents_backup", "healthy", str(backup_file))
        else:
            print_check("agents_backup", "drifted", str(backup_file))
            final_status = "drifted"

    for rel_path in managed_files:
        candidate = root / rel_path
        if candidate.exists():
            print_check("managed_file", "healthy", str(candidate))
        else:
            print_check("managed_file", "drifted", str(candidate))
            final_status = "drifted"

    if final_status == "healthy":
        print(f"[overall] healthy install is intact codex_home={root}")
        print("[next] none")
        return 0

    restore_path = root / "godex" / "bin" / "godex-restore"
    print(f"[overall] {final_status} install drift detected codex_home={root}")
    if restore_path.exists():
        print(f"[next] run {restore_path} {root} and then reinstall")
    else:
        print("[next] reinstall the global layer to repair missing or changed files")
    return 1


def main() -> int:
    parser = argparse.ArgumentParser(description="Inspect a godex global install")
    parser.add_argument("codex_home", nargs="?", default=str(default_codex_home()))
    args = parser.parse_args()
    return classify_codex_home(Path(args.codex_home).expanduser().resolve())


if __name__ == "__main__":
    raise SystemExit(main())
