<!-- Generated: 2025-07-05 00:00:00 UTC -->

# Files Catalog

This catalog groups all significant files by function, helping LLMs and developers quickly locate entry points, configs, and core logic. See cross-references for details.

## Core Source Files
- `py_zerox/pyzerox/core/zerox.py` - Python main orchestrator
- `node-zerox/src/index.ts` - Node.js entry point
- `py_zerox/pyzerox/models/` - Model definitions (Python)
- `node-zerox/src/models/` - Model definitions (Node.js)
- `py_zerox/pyzerox/processor/` - Processing logic (Python)
- `node-zerox/src/utils/` - Processing logic (Node.js)

## Platform Implementation
- `py_zerox/pyzerox/errors/` - Python error handling
- `node-zerox/src/utils/` - Node.js utilities and error handling

## Build System
- `pyproject.toml` - Python build/config
- `package.json` - Node.js build/config
- `Makefile` - Unified build targets
- `node-zerox/tsconfig.json` - TypeScript config

## Configuration & Assets
- `shared/inputs/` - Input files for processing
- `shared/outputs/` - Output files/results
- `assets/` - Documentation and images
- `scripts/` - Helper scripts (Python)

## Reference
- **Entry points:** `zerox.py`, `index.ts`
- **Build configs:** `pyproject.toml`, `package.json`, `Makefile`
- **Test files:** `py_zerox/tests/`, `node-zerox/tests/`
- **Naming:** Folders by function (core, models, processor, errors, utils)

See [docs/architecture.md](architecture.md) for system structure.
