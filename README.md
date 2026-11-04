# RedNote Monthly Report skill

Analyze every RedNote post from backend screenshots, then write a client-ready monthly account analysis. The skill checks for missing evidence and can use account totals, PMs, and comments. It does not create slides.

This repository contains only the reusable skill. Keep client screenshots, messages, account data, and the source benchmark PDF in a separate private folder.

## Install in Codex or Claude Code

Download and extract this repository, or clone it. Open a terminal in the extracted `rednote-monthly-report` folder. The installers copy `SKILL.md`, `agents/openai.yaml`, and `references/benchmark.md` into a personal skills folder. They stop if a folder with this skill name already exists, so they never silently replace an installed version.

| Product | Personal skill location | How to invoke |
| --- | --- | --- |
| Codex | `~/.agents/skills/rednote-monthly-report/` | Mention `$rednote-monthly-report` or describe the monthly report task |
| Claude Code | `~/.claude/skills/rednote-monthly-report/` | Type `/rednote-monthly-report` or describe the task |

Codex installations that still use `~/.codex/skills` can set `CODEX_SKILLS_DIR` to that directory before running the installer. The location inside your home directory is the same on macOS and Windows; `~` means your user home folder. After installation, start a new session if the skill does not appear.

### macOS or Linux

```sh
sh install.sh codex
sh install.sh claude
```

Run either line, or both to install for both products. To use an older Codex skills location:

```sh
CODEX_SKILLS_DIR="$HOME/.codex/skills" sh install.sh codex
```

### Windows PowerShell

In File Explorer, open the extracted folder, type `powershell` in the address bar, and press Enter. Then run either or both commands:

```powershell
.\install.ps1 -Target Codex
.\install.ps1 -Target Claude
```

For an older Codex skills location, run `$env:CODEX_SKILLS_DIR = Join-Path $HOME '.codex\skills'` before the Codex command. If PowerShell blocks scripts on your machine, manually copy the three skill files into the product's personal skill folder, preserving `agents/` and `references/`.

These locations follow the current [Codex skills guide](https://learn.chatgpt.com/docs/build-skills) and [Claude Code skills guide](https://code.claude.com/docs/en/skills).

### Update an existing installation

1. Download and extract the newest repository version, or run `git pull` in your clone.
2. Close Codex or Claude Code. Find the installed `rednote-monthly-report` folder using the personal skill locations in the table above. If you used `CODEX_SKILLS_DIR` or `CLAUDE_SKILLS_DIR`, look there instead.
3. Move the old skill folder **outside** the skills directory, such as into a backup folder under your home directory. Keeping it inside a skills directory may cause a duplicate skill to appear.
4. Open a terminal in the newly downloaded or updated repository folder and rerun the matching installer command below. The installers intentionally stop if a folder with that skill name still exists.
5. Start a new Codex or Claude Code session and invoke the skill to confirm it loads. Once the new version works, you may keep or delete your backup.

For Claude web or desktop, upload a fresh skill ZIP from the newest repository version, then disable or remove the older uploaded copy. Keep client evidence outside the skill ZIP.

### Claude web or desktop app

Claude's web and desktop app use a skill ZIP upload rather than the local Claude Code folder. Put this repository's skill files inside a folder named `rednote-monthly-report`, ZIP that folder, then use **Customize → Skills → + Create skill → Upload a skill**. Enable the uploaded skill. Do not include client data in that ZIP. See [Claude's custom skill upload guide](https://support.claude.com/en/articles/12512180-use-skills-in-claude). When using a web or cloud session, upload the month's evidence files to that session or connect a source it can access; a local folder path alone is not available there.

## Prepare the monthly backend screenshot folder

Create one **private folder per account and reporting month**. The names below are an example; the important part is that each screenshot can be tied to one post or to the overall account, with a clear date window and screenshot cutoff.

```text
RedNote Reports/
└── Client Name/
    └── 2026-10/
        ├── post-list.csv
        ├── Overall Account Data/
        │   ├── account-overview_2026-10-01_to_2026-10-31.png
        │   ├── account-traffic-and-follows_2026-10.png
        │   └── account-audience_2026-10.png
        ├── Posts/
        │   ├── 2026-10-05_KL-food-guide/
        │   │   ├── overview_2026-11-02.png
        │   │   ├── traffic-sources_2026-11-02.png
        │   │   ├── retention_2026-11-02.png
        │   │   └── engagement-and-follows_2026-11-02.png
        │   └── 2026-10-18_product-guide/
        │       └── ...
        ├── PM and Comments/
        │   ├── pm_2026-10-21.png
        │   └── comments_2026-10-18.png
        └── source-notes.md
```

1. **List every post published in the month** in `post-list.csv` or a posting-calendar export. Include publish date, title/topic, and post link or ID. Put older posts updated during the month in a separate section of `source-notes.md` as historical references.
2. **Save overall account screenshots** for the reporting date range: reach/exposure, views and viewing, engagement, followers, profile visits or conversion, and traffic sources. Save audience data when relevant.
3. **Give each post its own folder.** Save readable screenshots for its overview, reach/views, cover click-through rate, likes/comments/saves, follows, traffic sources, and retention metrics shown in the backend (2-second exit, 5-second completion, average watch time, full completion). Keep the post title, publish date, and screenshot cutoff visible when possible.
4. **Save relevant PMs and comments** in the private `PM and Comments/` folder. Include inquiries about location, price, orders, products, catalogs, or wholesale. Do not treat inquiries as confirmed sales. Mask private identifiers before sharing outside the reporting team.
5. **Record gaps in `source-notes.md`.** Note missing or unreadable screenshots, unavailable metrics, conflicting values, and the cutoff date for each post. If there were no PMs or comments to analyze, say so there explicitly.

Do not rely on filenames alone to prove a metric or date; the screenshots must show the backend values. Send the whole private monthly folder or a ZIP of it to the analyst, separately from this public skill repository. The skill will ask for any missing evidence before completing the report.

## Account analysis output style

The final **本月账号状态分析** should read like a clean report slide: a short overall takeaway, **核心数据** bullets, then brief **内容观察** bullets on content that gained traffic or generated inquiries. Add **咨询与线索** only when PM/comment evidence exists. Keep each paragraph short and put important numbers in bullets instead of one long block of prose. Pair a weaker result with a practical suggestion in a constructive tone. Do not add a separate generic **下一阶段** plan.
