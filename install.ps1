param(
    [ValidateSet('Codex', 'Claude')]
    [string]$Target = 'Codex'
)

$ErrorActionPreference = 'Stop'
$sourceDir = Split-Path -Parent $MyInvocation.MyCommand.Path

if ($Target -eq 'Codex') {
    $skillsDir = if ($env:CODEX_SKILLS_DIR) { $env:CODEX_SKILLS_DIR } else { Join-Path $HOME '.agents\skills' }
} else {
    $skillsDir = if ($env:CLAUDE_SKILLS_DIR) { $env:CLAUDE_SKILLS_DIR } else { Join-Path $HOME '.claude\skills' }
}

$targetDir = Join-Path $skillsDir 'rednote-monthly-report'
if (Test-Path -LiteralPath $targetDir) {
    throw "Skill already exists: $targetDir"
}

$files = @('SKILL.md', 'agents/openai.yaml', 'references/benchmark.md')
foreach ($file in $files) {
    $sourceFile = Join-Path $sourceDir $file
    if (-not (Test-Path -LiteralPath $sourceFile -PathType Leaf)) {
        throw "Missing skill file: $sourceFile"
    }
}

New-Item -ItemType Directory -Path (Join-Path $targetDir 'agents'), (Join-Path $targetDir 'references') -Force | Out-Null
foreach ($file in $files) {
    Copy-Item -LiteralPath (Join-Path $sourceDir $file) -Destination (Join-Path $targetDir $file)
}

Write-Output "Installed $Target skill at $targetDir"
