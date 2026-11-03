# RedNote Monthly Report skill

This package contains only the reusable Codex skill. It does not include client screenshots, PMs, account data, or the source benchmark PDF.

## Install on macOS

From this directory after downloading or cloning it:

```sh
sh install.sh
```

The installer copies `SKILL.md`, `agents/openai.yaml`, and `references/benchmark.md` to `${CODEX_HOME:-$HOME/.codex}/skills/rednote-monthly-report`. It stops if that destination already exists so it cannot silently overwrite a local version. No Python, Node, PowerShell, or Windows path is required to install or run the skill.

For a manual install, copy those same files into the matching folder under your Codex skills directory, preserving the `agents/` and `references/` subfolders.

The user supplies the month's backend screenshot folders when using the skill. The skill asks for missing evidence before completing the analysis.
