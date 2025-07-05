
# Changelog

All notable changes to this project will be documented in this file.

This project follows [Keep a Changelog](https://keepachangelog.com/en/1.1.0/) and [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---


## [1.1.20] - 2025-07-05
### Changed
- Node.js codebase reverted to CommonJS/ES5 for maximum compatibility.
- Downgraded `p-limit` to v3.x and `file-type` to v16.x (last CommonJS-compatible versions).
- All dynamic ESM imports removed; static CommonJS imports restored for `p-limit` and `file-type`.
- Updated all usages of `p-limit` and `file-type` to use their CommonJS APIs.
- Fixed all type and import issues in both `src` and `tests`.
- All Node.js tests now pass in CommonJS mode.

### Fixed
- ESM/CommonJS compatibility issues in Node.js code and tests.

---

---

## [0.0.8] - 2025-07-05
### Added
- Author "raphaelmansuy" added to project metadata.
- Makefile: Added publish and publish-dry-run commands for PyPI/TestPyPI.
- Makefile: User-friendly help and command organization.

### Changed
- Version bumped to 0.0.8 in pyproject.toml.
- Changelog rewritten for clarity and conciseness.

