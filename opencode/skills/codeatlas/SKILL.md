---
name: codeatlas
description: Use when the user wants a fast architecture map from a GitHub repository URL or local code folder, and specifically needs a direct HTML visualization of module-to-module relationships. This skill is lightweight: the model inspects the repo, extracts modules/relations, and writes a self-contained HTML report (no external fetch required) plus a small JSON and summary file.
---

# CodeAtlas

Generate a project relationship map directly from model reasoning + lightweight repo inspection, then output a single-file HTML visualization.

## Input -> Output contract

Input accepted:
- Public GitHub repo URL (`https://github.com/<owner>/<repo>`)
- Local repository path

Output required (same run):
- `outputs/skill-runs/<run-id>/codeatlas.html`
- `outputs/skill-runs/<run-id>/module-map.json`
- `outputs/skill-runs/<run-id>/summary.md`

`<run-id>` format:
- `<repo-name>-<platform>-<attempt>`
- Example: `flask-opencode-attempt-01`

## Workflow

1. Acquire source
- If input is GitHub URL, clone to `.tmp/repos/<repo-name>-<platform>-<attempt>`.
- If input is local path, use it directly.

2. Build module map
- Infer top-level modules from folder structure and package manifests.
- Infer key module relations from import/use/require patterns.
- Keep architecture-level granularity (module-to-module), not function-level call graph.

3. Write `module-map.json`
- Must include:
  - `project`
  - `source`
  - `modules` (name + role summary)
  - `relations` (source, target, type, reason)
  - `entrypoints`

4. Write `codeatlas.html` as a single file
- Must be self-contained and open directly via local `file://` path.
- Do not use `fetch()` to load local JSON.
 - Do not reference external JS/CSS/CDN URLs via `<script src="http(s)://...">` or `<link href="http(s)://...">`.
- Prefer copying `assets/codeatlas-single-file-template.html` and replacing the JSON payload.
- Embed data with:
  - `<script id="codeatlas-data" type="application/json"> ... </script>`
- Render at least:
  - project summary
  - module cards with beginner-friendly hints
  - relation table with both raw reason and beginner explanation
  - layered relationship graph (SVG) with arrow direction and relation-type legend
  - detailed project framework flow graph (SVG) placed below the relationship graph
  - framework flow details table (cross-layer relation mix + example routes + impact hints)

5. Write `summary.md`
- Include:
  - architecture conclusion
  - top module relationships (5-12 bullets)
  - blind spots / uncertainty
  - output file paths

6. Validate before finishing
- Check files exist: `codeatlas.html`, `module-map.json`, `summary.md`.
- Check HTML constraints:
  - contains `id="codeatlas-data"`
  - does not contain `fetch(`
  - does not contain external script/link URL refs (`<script src="http(s)://...">`, `<link href="http(s)://...">`)
- If validation fails, rewrite HTML and re-check.

## Response contract (chat)

Return in this order:
1. One-paragraph architecture conclusion
2. Key module relationships
3. Risks / blind spots
4. Exact output file paths

## Iteration rule

When user asks for repeated validation across platforms:
- Run at least 5 attempts total across `opencode` and `codex`.
- Save each run to unique `<run-id>` output folder.
- Keep a concise attempt log in `logs/attempts.md`.

When user asks for specific model/tool validation (for example, opencode deepseek and codex `/fast`):
- Follow the requested tool/model pair exactly.
- For codex `/fast`, enforce fast tier (for example `service_tier=fast`).
- Run at least 3 iterative attempts (or more if user requests).
- If user asks to clean old runs, delete old `outputs/skill-runs/*` before new attempts.

## References

- `references/input-output.md`
- `references/html-requirements.md`
- `references/attempt-checklist.md`
- `assets/codeatlas-single-file-template.html`
