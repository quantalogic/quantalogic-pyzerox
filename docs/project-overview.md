<!-- Generated: 2025-07-05 00:00:00 UTC -->

# Project Overview

Quantalogic PyZeroX is a cross-platform, multi-language toolkit for document processing, LLM integration, and AI-powered workflows. It provides Python and Node.js APIs for extracting, converting, and analyzing documents (PDF, PNG, etc.), with a focus on modularity and extensibility. The project enables rapid prototyping and production deployment of AI-driven document pipelines.

## Key Files
- **Python entry point:** `py_zerox/pyzerox/core/zerox.py` (main logic)
- **Node.js entry point:** `node-zerox/src/index.ts`
- **Build configs:** `pyproject.toml`, `package.json`, `Makefile`, `jest.config.js`
- **Shared assets:** `shared/inputs/`, `shared/outputs/`

## Technology Stack
- **Python 3.8+** (`py_zerox/`)
- **Node.js (TypeScript)** (`node-zerox/`)
- **Poetry** (`pyproject.toml`)
- **Jest** (`jest.config.js`)
- **Make** (`Makefile`)

## Platform Support
- **macOS, Linux, Windows** (see `pyproject.toml`, `Makefile`)
- **Node.js** (see `node-zerox/tsconfig.json`)
- **Python** (see `py_zerox/`)

See [docs/files.md](files.md) for a full file catalog.
