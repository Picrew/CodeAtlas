# SGLang Architecture Summary

SGLang is a multi-subsystem serving platform: the Python `sglang` package is the main runtime/control entry (CLI -> SRT HTTP/gRPC/disaggregation engines), `sgl-kernel` provides low-level compiled acceleration kernels consumed heavily by SRT layers, and `sgl-model-gateway` is a Rust control/data-plane router that adds multi-worker policy routing, OpenAI-compatible APIs, service discovery, and observability for production deployments.

## Top Module Relationships

- `python/sglang/cli` -> `python/sglang/launch_server.py`: CLI serve command dispatches to standard runtime startup.
- `python/sglang/cli` -> `python/sglang/multimodal_gen`: diffusion model requests branch into multimodal generation runtime.
- `python/sglang/launch_server.py` -> `python/sglang/srt/entrypoints`: launch chooses HTTP/gRPC/Ray entrypoint.
- `python/sglang/launch_server.py` -> `python/sglang/srt/disaggregation`: encoder-only and PD-related serve paths are selected here.
- `python/sglang/lang` -> `python/sglang/srt/entrypoints`: frontend API can instantiate runtime Engine from backend entrypoints.
- `python/sglang/srt/entrypoints` -> `python/sglang/srt/managers`: entrypoint server logic imports tokenizer/template/scheduler manager stack.
- `python/sglang/srt/entrypoints` -> `python/sglang/srt/grpc`: gRPC server pipeline uses grpc request and scheduler modules.
- `python/sglang/srt/model_executor` -> `python/sglang/srt/layers`: inference execution depends on attention/MoE/quantization/sampling layers.
- `python/sglang/srt/layers` -> `sgl-kernel/python/sgl_kernel`: layer kernels call into compiled ops from `sgl_kernel`.
- `sgl-kernel/python/sgl_kernel` -> `sgl-kernel/csrc`: Python kernel package loads native extensions compiled from csrc.
- `sgl-model-gateway/src/main.rs` -> `sgl-model-gateway/src/server`: gateway binary startup routes into server runtime.
- `sgl-model-gateway/src/server` -> `sgl-model-gateway/src/routers`: API handlers delegate traffic to router manager/router traits.
- `sgl-model-gateway/src/server` -> `sgl-model-gateway/src/core`: server lifecycle relies on worker registry/job queue/workflow primitives.
- `sgl-model-gateway/src/server` -> `sgl-model-gateway/src/service_discovery`: optional k8s discovery loop keeps workers synchronized.
- `sgl-model-gateway/src/routers` -> `sgl-model-gateway/src/policies`: policy engines drive worker and model routing.

## Blind Spots / Uncertainty

- This map is architecture-level and intentionally omits many fine-grained internal modules (e.g., every `srt/models/*` adapter).
- Cross-language runtime coupling (Python SRT workers behind Rust gateway) is inferred from public entrypoints/docs and module boundaries, not full runtime trace.
- Some optional paths are environment-conditional (Ray, NPU/XPU kernels, OpenAI backend mode, WASM extensions).

## Output Files

- `/Users/lijunjie/Downloads/code_atlas/outputs/skill-runs/sglang-codex-fast-medium-attempt-14/codeatlas.html`
- `/Users/lijunjie/Downloads/code_atlas/outputs/skill-runs/sglang-codex-fast-medium-attempt-14/module-map.json`
- `/Users/lijunjie/Downloads/code_atlas/outputs/skill-runs/sglang-codex-fast-medium-attempt-14/summary.md`
