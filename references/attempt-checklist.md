# Attempt Checklist

For each attempt:

1. Confirm source cloned or resolved.
2. Confirm output folder created under `outputs/skill-runs/<run-id>/`.
3. Confirm all files exist:
- `codeatlas.html`
- `module-map.json`
- `summary.md`
4. Confirm `codeatlas.html` does not contain `fetch(`.
5. Confirm `codeatlas.html` contains `id="codeatlas-data"`.
6. Confirm `codeatlas.html` does not contain external `<script src="http(s)://...">` or `<link href="http(s)://...">`.
7. Confirm relationship graph section and framework flow graph section are both present.
8. Confirm framework details table is present (relation mix + examples + impact hints).
9. Confirm relation table includes beginner explanation content.
10. Append one short log block to `logs/attempts.md`.

Minimum multi-platform validation:
- total attempts >= 5
- includes both `opencode` and `codex`

When user specifies model/tool constraints:
- honor requested pairing exactly (for example `opencode + deepseek/deepseek-reasoner`, `codex + /fast`)
- run at least 3 attempts unless user requests a higher count
