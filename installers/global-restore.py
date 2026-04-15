#!/usr/bin/env python3
from __future__ import annotations

import argparse
import json
import shutil
from datetime import datetime, timezone
from pathlib import Path

START_MARKER = "<!-- GODEX GLOBAL BLOCK START -->"
END_MARKER = "<!-- GODEX GLOBAL BLOCK END -->"


def default_codex_home() -> Path:
    return Path.home() / ".codex"


def remove_block(text: str) -> str:
    if START_MARKER not in text or END_MARKER not in text:
        return text
    start = text.index(START_MARKER)
    end = text.index(END_MARKER) + len(END_MARKER)
    cleaned = text[:start] + text[end:]
    lines = [line.rstrip() for line in cleaned.splitlines()]
    while lines and lines[0] == "":
        lines.pop(0)
    while lines and lines[-1] == "":
        lines.pop()
    return "\n".join(lines) + ("\n" if lines else "")


def main() -> int:
    parser = argparse.ArgumentParser(description="Restore a Codex home from a godex global install")
    parser.add_argument("codex_home", nargs="?", default=str(default_codex_home()))
    args = parser.parse_args()

    root = Path(args.codex_home).expanduser().resolve()
    godex_dir = root / "godex"
    manifest_path = godex_dir / "manifest.json"
    agents_path = root / "AGENTS.md"

    if not godex_dir.exists():
        print(f"[restore] missing {godex_dir}")
        return 1

    manifest = {}
    if manifest_path.is_file():
        try:
            manifest = json.loads(manifest_path.read_text())
        except json.JSONDecodeError:
            manifest = {}

    backup_rel = manifest.get("agents_backup")
    backup_file = root / backup_rel if backup_rel else None

    if backup_file and backup_file.is_file():
        shutil.copy2(backup_file, agents_path)
        print(f"[agents] restored backup {backup_file}")
    elif agents_path.is_file():
        updated = remove_block(agents_path.read_text())
        if updated.strip():
            agents_path.write_text(updated)
            print(f"[agents] removed godex block from {agents_path}")
        else:
            agents_path.unlink()
            print(f"[agents] removed {agents_path}")

    archive_root = root / "godex-backups"
    if (godex_dir / "backups").exists():
        stamp = datetime.now(timezone.utc).strftime("%Y%m%d-%H%M%S")
        archive_dir = archive_root / stamp
        archive_dir.parent.mkdir(parents=True, exist_ok=True)
        shutil.copytree(godex_dir / "backups", archive_dir)
        print(f"[archive] copied backups to {archive_dir}")

    shutil.rmtree(godex_dir, ignore_errors=True)
    print(f"[uninstall] removed {godex_dir}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
