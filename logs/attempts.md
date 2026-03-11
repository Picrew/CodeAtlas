# Attempt Log

This file records current cross-platform validation attempts after cleanup on 2026-03-11.

## Iter-10 (2026-03-11)
- Run ID: `requests-opencode-deepseek-attempt-10`
- Platform/Model: `opencode` / `deepseek/deepseek-reasoner`
- Source: `/Users/lijunjie/Downloads/code_atlas/.tmp/repos/requests`
- Result: `pass_with_quality_gap`
- Checks: `id="codeatlas-data"` yes, `fetch(` no, external `<script src>/<link href>` no, framework-flow graph yes
- Notes: 18 modules, 7 relations (mostly imports). Output contract passes but relation richness is lower than codex runs.

## Iter-11 (2026-03-11)
- Run ID: `requests-codex-fast-attempt-11`
- Platform/Model: `codex` / `gpt-5.3-codex` (`service_tier=fast`)
- Source: `/Users/lijunjie/Downloads/code_atlas/.tmp/repos/requests`
- Result: `pass`
- Checks: `id="codeatlas-data"` yes, `fetch(` no, external `<script src>/<link href>` no, framework-flow graph yes
- Notes: 18 modules, 76 relations. Stronger architecture signal with mixed `imports + calls + runtime_flow`.

## Iter-12 (2026-03-11)
- Run ID: `is-codex-fast-attempt-12`
- Platform/Model: `codex` / `gpt-5.3-codex` (`service_tier=fast`)
- Source: `/Users/lijunjie/Downloads/code_atlas/.tmp/repos/is`
- Result: `pass`
- Checks: `id="codeatlas-data"` yes, `fetch(` no, external `<script src>/<link href>` no, framework-flow graph yes
- Notes: 7 modules, 13 relations. Validates small TypeScript repo behavior with both graphs and beginner-friendly text.

## Iter-13 (2026-03-11)
- Run ID: `vllm-codex-fast-medium-attempt-13`
- Platform/Model: `codex` / `gpt-5.3-codex` (`service_tier=fast`, `model_reasoning_effort=medium`)
- Source: `/Users/lijunjie/Downloads/code_atlas/.tmp/repos/vllm`
- Result: `pass`
- Checks: `id="codeatlas-data"` yes, `fetch(` no, external `<script src>/<link href>` no, framework-flow graph yes, framework details table yes
- Notes: 18 modules, 37 relations. Good separation of serving entrypoints, v1 engine/core/executor/worker, model executor, distributed, and kernel/csrc path.

## Iter-14 (2026-03-11)
- Run ID: `sglang-codex-fast-medium-attempt-14`
- Platform/Model: `codex` / `gpt-5.3-codex` (`service_tier=fast`, `model_reasoning_effort=medium`)
- Source: `/Users/lijunjie/Downloads/code_atlas/.tmp/repos/sglang`
- Result: `pass`
- Checks: `id="codeatlas-data"` yes, `fetch(` no, external `<script src>/<link href>` no, framework-flow graph yes, framework details table yes
- Notes: 22 modules, 29 relations. Captures Python SRT runtime, sgl-kernel, and Rust model-gateway cross-subsystem architecture.

## Iter-15 (2026-03-11)
- Run ID: `transformers-codex-fast-medium-attempt-15`
- Platform/Model: `codex` / `gpt-5.3-codex` (`service_tier=fast`, `model_reasoning_effort=medium`)
- Source: `/Users/lijunjie/Downloads/code_atlas/.tmp/repos/transformers`
- Result: `pass`
- Checks: `id="codeatlas-data"` yes, `fetch(` no, external `<script src>/<link href>` no, framework-flow graph yes, framework details table yes
- Notes: 13 modules, 28 relations. Highlights package facade, pipelines/trainer orchestration, modeling/generation core, and utilities/integrations foundation.
