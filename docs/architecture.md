<!-- Generated: 2025-07-05 00:00:00 UTC -->

# Architecture

Quantalogic PyZeroX is organized as a modular, multi-language system with clear separation between core logic, platform adapters, and shared assets. The architecture supports both Python and Node.js runtimes, enabling flexible integration and extension.

## Component Map
- **Core Logic:** `py_zerox/pyzerox/core/zerox.py`, `node-zerox/src/index.ts`
- **Models:** `py_zerox/pyzerox/models/`, `node-zerox/src/models/`
- **Processors:** `py_zerox/pyzerox/processor/`
- **Error Handling:** `py_zerox/pyzerox/errors/`
- **Shared Assets:** `shared/inputs/`, `shared/outputs/`

## Key Files
- **Python core:** `py_zerox/pyzerox/core/zerox.py` (main orchestrator)
- **Node.js core:** `node-zerox/src/index.ts` (entry point)
- **Model definitions:** `py_zerox/pyzerox/models/base.py`, `node-zerox/src/models/`
- **Processor logic:** `py_zerox/pyzerox/processor/`

## Data Flow
- Input files are placed in `shared/inputs/`
- Processing is handled by `zerox.py` (Python) or `index.ts` (Node.js)
- Outputs are written to `shared/outputs/`
- Model and processor modules are dynamically loaded (see `py_zerox/pyzerox/core/zerox.py:load_model`)

See [docs/files.md](files.md) for a full file catalog.
