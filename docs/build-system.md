<!-- Generated: 2025-07-05 00:00:00 UTC -->

# Build System

Quantalogic PyZeroX uses Poetry for Python builds and npm/TypeScript for Node.js. The Makefile provides unified build, test, and clean targets for both stacks.

## Build Workflows
- **Python:**
  - Install: `poetry install` (`pyproject.toml`)
  - Build: `poetry build` (`pyproject.toml`)
- **Node.js:**
  - Install: `npm install` (`package.json`)
  - Build: `npx tsc` (`node-zerox/tsconfig.json`)
- **Unified:**
  - `make` (see `Makefile` for targets)

## Platform Setup
- **Python:** Requires Python 3.8+ (`pyproject.toml`)
- **Node.js:** Requires Node.js 18+ (`package.json`)
- **Cross-platform:** See `Makefile` for OS-specific logic

## Reference
- **Build configs:** `pyproject.toml`, `package.json`, `Makefile`, `node-zerox/tsconfig.json`
- **Troubleshooting:** See comments in `Makefile` and `pyproject.toml`

See [docs/development.md](development.md) for code style and patterns.
