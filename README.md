<div align="center">
  <h1>CodeAtlas</h1>
  <p><strong>Lightweight skill for repository architecture mapping and single-file HTML graph output</strong></p>
  <p>
    <a href="./README.md"><img src="https://img.shields.io/badge/Language-English-0B84D8?style=flat-square&labelColor=555555" alt="Language English" /></a>
    <a href="./README_ZH.md"><img src="https://img.shields.io/badge/Language-%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87-E25544?style=flat-square&labelColor=555555" alt="Language Simplified Chinese" /></a>
    <a href="https://docs.anthropic.com/en/docs/claude-code/skills"><img src="https://img.shields.io/badge/Claude%20Code-Skill-0B84D8?style=flat-square&labelColor=555555" alt="Claude Code Skill" /></a>
    <a href="./LICENSE"><img src="https://img.shields.io/badge/License-MIT-87C400?style=flat-square&labelColor=555555" alt="License MIT" /></a>
  </p>
</div>

CodeAtlas is a practical skill that turns a GitHub repository URL or local repository path into an architecture-level relationship map. It outputs a self-contained `codeatlas.html` (local `file://` friendly), plus `module-map.json` and `summary.md` in one run.

## At A Glance

| This project is | This project is not |
| --- | --- |
| A lightweight skill for module-level architecture mapping | A full static-analysis platform |
| A single-run output contract (`HTML + JSON + Summary`) | A heavy multi-stage pipeline |
| A local-open visualization workflow (no runtime `fetch`) | A server-dependent visualization app |
| A practical skill for Codex / Claude-style usage | A private-repo auth workflow (v1) |

## Features

| Feature | What it gives you |
| --- | --- |
| GitHub URL or local path input | Analyze public repos or local folders directly |
| Architecture-level graph | Focus on module-to-module relationships, not noisy function-level calls |
| Single-file HTML output | Open directly via `file://.../codeatlas.html` |
| Dual SVG graph views | Layered relationship graph + detailed project framework flow graph in one file |
| Framework flow details table | Cross-layer relation mix, route examples, and impact hints for architecture discussions |
| Beginner-friendly explanation layer | Module cards and relation table include plain-language guidance |
| Embedded JSON data contract | Stable `module-map.json` and embedded `id="codeatlas-data"` |
| Multi-platform validation loop | Repeat across `opencode` and `codex`, log each attempt |
| Failure-oriented iteration | Track bad cases and improve the skill contract |

## Input / Output Contract

### Input

- Public GitHub URL: `https://github.com/<owner>/<repo>`
- Local repository path

No manual download is required when you provide a GitHub URL.  
CodeAtlas can fetch the repository into a temporary workspace and analyze it directly.

### Output folder

`outputs/skill-runs/<run-id>/`

### Required output files

- `codeatlas.html`
- `module-map.json`
- `summary.md`

`codeatlas.html` requirements:
- single file
- contains `<script id="codeatlas-data" type="application/json">`
- no runtime `fetch()`
- no external `<script src="http(s)://...">` or `<link href="http(s)://...">`
- includes layered relationship SVG graph with legend
- includes project framework flow SVG graph below the relationship graph
- includes framework flow details table (relation mix + examples + impact hints)
- relation area includes a beginner explanation column

### `module-map.json` shape

```json
{
  "project": "string",
  "source": "string or object",
  "modules": [{ "name": "string", "role": "string" }],
  "relations": [
    {
      "source": "string",
      "target": "string",
      "type": "imports|depends_on|calls|runtime_flow",
      "reason": "string"
    }
  ],
  "entrypoints": ["string"]
}
```

## How It Works

1. Resolve source (GitHub URL or local path).
2. Build module map from folder structure + imports.
3. Generate `module-map.json`.
4. Render `codeatlas.html` with embedded JSON, layered relationship graph, and framework flow graph.
5. Write `summary.md` (conclusion, key relations, risks).
6. Validate output constraints before finish.

## Installation

### Codex (personal)

```bash
mkdir -p ~/.codex/skills/codeatlas
cp -R . ~/.codex/skills/codeatlas
```

### Claude Code (personal)

```bash
mkdir -p ~/.claude/skills/codeatlas
cp -R . ~/.claude/skills/codeatlas
```

### Project-local install

```bash
mkdir -p .codex/skills/codeatlas
cp -R . .codex/skills/codeatlas
```

## Starter Prompt

```markdown
Use $codeatlas to analyze this repository and output files under outputs/skill-runs/<run-id>/:
- codeatlas.html
- module-map.json
- summary.md

Source: <GitHub URL or local path>
Constraints:
- architecture-level module relations
- codeatlas.html must be single-file with embedded codeatlas-data
- include layered relation graph + framework flow graph
- include beginner-friendly explanations
- no fetch, no external script/link URLs
```

## Verified Test Runs (March 11, 2026)

High-quality showcase runs:
- `outputs/skill-runs/requests-opencode-deepseek-attempt-10/`
- `outputs/skill-runs/requests-codex-fast-attempt-11/`
- `outputs/skill-runs/is-codex-fast-attempt-12/`
- `outputs/skill-runs/vllm-codex-fast-medium-attempt-13/`
- `outputs/skill-runs/sglang-codex-fast-medium-attempt-14/`
- `outputs/skill-runs/transformers-codex-fast-medium-attempt-15/`

Iteration log:
- local only (ignored): `logs/attempts.md`

## Example Gallery

| vLLM Case | Transformers Case A | Transformers Case B |
| --- | --- | --- |
| ![vLLM architecture case](./assets/case-vllm-architecture.jpg) | ![Transformers architecture case 1](./assets/case-transformers-architecture-01.jpg) | ![Transformers architecture case 2](./assets/case-transformers-architecture-02.jpg) |

## Repository Layout

```text
code_atlas/
|-- SKILL.md
|-- README.md
|-- README_ZH.md
|-- agents/openai.yaml
|-- assets/
|   `-- codeatlas-single-file-template.html
|-- references/
|   |-- input-output.md
|   |-- html-requirements.md
|   `-- attempt-checklist.md
|-- scripts/
|   `-- new-run-id.sh
|-- outputs/
|   `-- skill-runs/
`-- LICENSE
```

## About (GitHub repository description)

Suggested short About text:

`Lightweight skill that turns a GitHub repo or local codebase into a single-file HTML architecture graph (plus JSON + summary).`

Suggested Topics:

`skills`, `codex`, `claude-code`, `code-analysis`, `architecture`, `knowledge-graph`, `html-visualization`, `repository-mapping`

## License

MIT. See [`LICENSE`](./LICENSE).
