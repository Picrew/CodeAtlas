# vLLM CodeAtlas Summary

## Architecture conclusion
vLLM is a layered high-throughput inference framework where `entrypoints` receive client/API traffic, `v1/engine` and `v1/core` orchestrate request scheduling and KV-cache-aware execution, and `v1/executor` + `v1/worker` drive device-level inference through `model_executor`, which is heavily backed by `distributed`, `config`, optimized `kernels`, and native `csrc` custom ops.

## Top module relationships
- `entrypoints -> v1/engine`: API/CLI surface creates AsyncLLM/LLMEngine clients.
- `v1/engine -> v1/core`: request objects flow into core scheduling loop.
- `v1/core -> v1/executor`: scheduler delegates concrete model execution to executor backend.
- `v1/executor -> v1/worker`: multiprocess executor launches and coordinates worker processes.
- `v1/worker -> model_executor`: worker runtime initializes and drives model runners.
- `model_executor -> config`: model loading/execution behavior is controlled by typed config.
- `model_executor -> distributed`: execution integrates TP/PP/DP communication primitives.
- `model_executor -> kernels -> csrc`: performance-critical paths descend into optimized kernels and native ops.
- `v1/engine -> plugins`: runtime IO processing is plugin-extensible.
- `plugins -> lora`: plugin system extends adapter resolution and LoRA integration behavior.

## Blind spots / uncertainty
- This map is architecture-level and intentionally avoids exhaustive file-level edges.
- Import frequency was sampled from Python sources; C++ runtime internals under `csrc/` are summarized, not fully expanded.
- Some dynamic runtime/plugin registration paths may create edges not directly visible from static imports.

## Output files
- `/Users/lijunjie/Downloads/code_atlas/outputs/skill-runs/vllm-codex-fast-medium-attempt-13/codeatlas.html`
- `/Users/lijunjie/Downloads/code_atlas/outputs/skill-runs/vllm-codex-fast-medium-attempt-13/module-map.json`
- `/Users/lijunjie/Downloads/code_atlas/outputs/skill-runs/vllm-codex-fast-medium-attempt-13/summary.md`
