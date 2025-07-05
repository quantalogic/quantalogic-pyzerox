<!-- Generated: 2025-07-05 00:00:00 UTC -->

# Development

Development is modular and cross-language. Python and Node.js codebases follow clear naming conventions and modular patterns. See code examples below for style and structure.

## Code Style
- **Python:**
  - Snake_case for functions/variables (see `py_zerox/pyzerox/core/zerox.py`)
  - Classes use PascalCase (see `py_zerox/pyzerox/models/base.py`)
  - Example:
    ```python
    # From py_zerox/pyzerox/core/zerox.py:10-13
    class ZeroX:
        def process(self, input_path):
            ...
    ```
- **Node.js/TypeScript:**
  - CamelCase for functions/variables (see `node-zerox/src/index.ts`)
  - Interfaces in `types.ts`, models in `models/`
  - Example:
    ```typescript
    // From node-zerox/src/index.ts:5-8
    export function processFile(inputPath: string) {
      // ...
    }
    ```

## Common Patterns
- **Modular imports:** Each module imports only what it needs
- **Error handling:** Centralized in `py_zerox/pyzerox/errors/` and `node-zerox/src/utils/`
- **Processor pattern:** Processors in `py_zerox/pyzerox/processor/` and `node-zerox/src/utils/`

## Workflows
- Add a processor: Create a new file in `processor/` (Python) or `utils/` (Node.js)
- Add a model: Extend `models/base.py` (Python) or add to `models/` (Node.js)
- Debug: Use logs in `shared/outputs/` and error modules

## Reference
- **Naming conventions:** See `core/`, `models/`, `processor/` folders
- **Common issues:** See error modules for patterns

See [docs/testing.md](testing.md) for test patterns.
