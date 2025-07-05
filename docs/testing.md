<!-- Generated: 2025-07-05 00:00:00 UTC -->

# Testing

Testing is organized by language: Python uses pytest, Node.js uses Jest. Test data is shared in `shared/inputs/` and `shared/outputs/`.

## Test Types
- **Python unit tests:** `py_zerox/tests/` (e.g., `test_noop.py`)
- **Node.js tests:** `node-zerox/tests/` (e.g., `performance.test.ts`)
- **Integration tests:** Use both stacks and shared assets

## Running Tests
- **Python:** `poetry run pytest py_zerox/tests/`
- **Node.js:** `npm test` (runs Jest, see `jest.config.js`)

## Reference
- **Test files:** `py_zerox/tests/`, `node-zerox/tests/`
- **Test configs:** `jest.config.js`, `pyproject.toml`

See [docs/build-system.md](build-system.md) for build/test targets.
