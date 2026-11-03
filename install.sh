#!/bin/sh
set -eu

source_dir=$(CDPATH= cd "$(dirname "$0")" && pwd)
codex_home=${CODEX_HOME:-"$HOME/.codex"}
target_dir="$codex_home/skills/rednote-monthly-report"

if [ -e "$target_dir" ]; then
  printf 'Skill already exists: %s\n' "$target_dir" >&2
  printf 'Review or remove the existing copy before installing this version.\n' >&2
  exit 1
fi

mkdir -p "$target_dir/agents" "$target_dir/references"
cp "$source_dir/SKILL.md" "$target_dir/SKILL.md"
cp "$source_dir/agents/openai.yaml" "$target_dir/agents/openai.yaml"
cp "$source_dir/references/benchmark.md" "$target_dir/references/benchmark.md"

printf 'Installed RedNote Monthly Report at %s\n' "$target_dir"
