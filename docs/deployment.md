<!-- Generated: 2025-07-05 00:00:00 UTC -->

# Deployment

Packaging and deployment are handled via Poetry (Python), npm (Node.js), and Makefile scripts. Output artifacts are placed in `dist/` (Python) and `node-zerox/dist/` (Node.js).

## Package Types
- **Python wheel/sdist:** `poetry build` → `dist/`
- **Node.js package:** `npm run build` → `node-zerox/dist/`

## Platform Deployment
- **Python:** Publish to PyPI (see `pyproject.toml`)
- **Node.js:** Publish to npm (see `package.json`)
- **Custom scripts:** See `Makefile` for unified deploy targets

## Reference
- **Deployment scripts:** `Makefile`, `scripts/pre_install.py`
- **Output locations:** `dist/`, `node-zerox/dist/`
- **Configs:** `pyproject.toml`, `package.json`

See [docs/build-system.md](build-system.md) for build details.
