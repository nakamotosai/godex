#!/usr/bin/env python3
from __future__ import annotations

import argparse
from pathlib import Path

MODE_CONFIG = {
    "project": {
        "start": "<!-- GODEX PROJECT BLOCK START -->",
        "end": "<!-- GODEX PROJECT BLOCK END -->",
        "target_label": "project",
        "scope_label": "root AGENTS.md",
    },
    "global": {
        "start": "<!-- GODEX GLOBAL BLOCK START -->",
        "end": "<!-- GODEX GLOBAL BLOCK END -->",
        "target_label": "codex_home",
        "scope_label": "Codex-home AGENTS.md",
    },
}


MANUAL_REVIEW_DIRECTIVES = {
    "godex: manual_review": "godex: manual_review",
    "godex: no_auto_append": "godex: no_auto_append",
    "godex: manual_merge_only": "godex: manual_merge_only",
    "godex: no_auto_merge": "godex: no_auto_merge",
}


def find_manual_review_directives(text: str) -> list[str]:
    normalized = text.lower().replace("-", "_")
    found: list[str] = []
    for needle, label in MANUAL_REVIEW_DIRECTIVES.items():
        if needle in normalized:
            found.append(label)
    return found


def print_lines(lines: list[str]) -> None:
    for line in lines:
        print(line)


def main() -> int:
    parser = argparse.ArgumentParser(description="Preflight a godex install target")
    parser.add_argument("--mode", choices=sorted(MODE_CONFIG), required=True)
    parser.add_argument("--target", required=True)
    parser.add_argument("--doc", required=True)
    parser.add_argument("--dry-run", action="store_true")
    args = parser.parse_args()

    cfg = MODE_CONFIG[args.mode]
    target = Path(args.target).expanduser().resolve()
    doc = Path(args.doc).resolve()
    agents_path = target / "AGENTS.md"

    if not target.is_dir():
        if args.mode == "global":
            lines = [
                f"[preflight] ready_create mode={args.mode} target={target}",
                f"[reason] no existing directory was found for this {cfg['target_label']}; install will create it",
            ]
            if args.dry_run:
                lines.append("[dry_run] no files changed")
            else:
                lines.append("[next] safe to create the Codex home and install")
            print_lines(lines)
            return 0
        print_lines(
            [
                f"[preflight] unsupported mode={args.mode} target={target}",
                f"[reason] target directory does not exist: {target}",
                "[next] choose an existing target and rerun the installer",
            ]
        )
        return 1

    if not agents_path.exists():
        lines = [
            f"[preflight] ready_create mode={args.mode} target={target}",
            f"[reason] no existing AGENTS.md was found for this {cfg['target_label']}",
        ]
        if args.dry_run:
            lines.append("[dry_run] no files changed")
        else:
            lines.append("[next] safe to install")
        print_lines(lines)
        return 0

    text = agents_path.read_text()
    start_count = text.count(cfg["start"])
    end_count = text.count(cfg["end"])
    if (start_count == 0) != (end_count == 0) or start_count > 1 or end_count > 1:
        print_lines(
            [
                f"[preflight] conflicted mode={args.mode} target={target}",
                f"[reason] {cfg['scope_label']} has missing, duplicated, or mismatched godex markers",
                "[next] fix the marker conflict manually before reinstalling",
            ]
        )
        return 2

    if start_count == 1:
        lines = [
            f"[preflight] ready_replace mode={args.mode} target={target}",
            f"[reason] existing managed godex block was found in {agents_path}",
        ]
        if args.dry_run:
            lines.append("[dry_run] no files changed")
        else:
            lines.append("[next] safe to upgrade the managed block in place")
        print_lines(lines)
        return 0

    signals = find_manual_review_directives(text)
    if signals:
        print_lines(
            [
                f"[preflight] manual_review mode={args.mode} target={target}",
                f"[reason] existing AGENTS.md explicitly blocks automatic godex append in this {cfg['target_label']}",
                f"[signals] {'; '.join(signals)}",
                f"[next] read {doc} and merge the godex block manually instead of mutating automatically",
            ]
        )
        return 3

    lines = [
        f"[preflight] ready_append mode={args.mode} target={target}",
        f"[reason] existing AGENTS.md is compatible with additive godex install in this {cfg['target_label']}",
    ]
    if args.dry_run:
        lines.append("[dry_run] no files changed")
    else:
        lines.append("[next] safe to append the managed godex block")
    print_lines(lines)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
