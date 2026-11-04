#!/bin/sh
set -eu

source_dir=$(CDPATH= cd "$(dirname "$0")" && pwd)
target=${1:-codex}

case "$target" in
  codex) skills_dir=${CODEX_SKILLS_DIR:-"$HOME/.agents/skills"} ;;
  claude) skills_dir=${CLAUDE_SKILLS_DIR:-"$HOME/.claude/skills"} ;;
  *) printf 'Usage: sh install.sh [codex|claude]\n' >&2; exit 2 ;;
esac

target_dir="$skills_dir/rednote-monthly-report"

if [ -e "$target_dir" ]; then
  printf 'Skill already exists: %s\n' "$target_dir" >&2
  exit 1
fi

for file in SKILL.md agents/openai.yaml references/benchmark.md; do
  if [ ! -f "$source_dir/$file" ]; then
    printf 'Missing skill file: %s\n' "$source_dir/$file" >&2
    exit 1
  fi
done

mkdir -p "$target_dir/agents" "$target_dir/references"
cp "$source_dir/SKILL.md" "$target_dir/SKILL.md"
cp "$source_dir/agents/openai.yaml" "$target_dir/agents/openai.yaml"
cp "$source_dir/references/benchmark.md" "$target_dir/references/benchmark.md"

printf 'Installed %s skill at %s\n' "$target" "$target_dir"
