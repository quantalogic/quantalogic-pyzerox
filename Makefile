# =============================
# Quantalogic PyZeroX Makefile
# =============================

.PHONY: help
help:
	@echo "\nQuantalogic PyZeroX Makefile Commands:\n"
	@echo "  help                Show this help message"
	@echo "  init                Initialize development environment (pre-commit, node, etc.)"
	@echo "  build               Build the Python package (wheel) and install dev/test deps"
	@echo "  test                Run all Python tests"
	@echo "  lint                Run ruff linter on source and tests"
	@echo "  format              Check code formatting with black"
	@echo "  lint-fix            Auto-fix lint issues with ruff"
	@echo "  format-fix          Auto-fix formatting with black"
	@echo "  fix                 Run both lint-fix and format-fix"
	@echo "  clean               Remove build artifacts and dist directory"
	@echo "  dev                 Build and prepare dev environment"
	@echo "  publish-dry-run     Build and upload to TestPyPI (dry run)"
	@echo "  publish             Build and upload to PyPI (real publish)"
	@echo "\nExample: make build\n"

# Publish to PyPI (dry run and real)
publish-dry-run:
	python3 -m build
	twine upload --repository testpypi dist/*

publish:
	python3 -m build
	twine upload dist/*

# Package/project config
PACKAGE_DIR := py_zerox
SRC_DIR := $(PACKAGE_DIR)/pyzerox
TEST_DIR := $(PACKAGE_DIR)/tests
DIST_DIR := $(PACKAGE_DIR)/dist

# Default target

.PHONY: all
all: help


# Initialization (optional, for devs)
.PHONY: init
init:
	@echo "== Initializing Development Environment =="
	brew install node || true
	brew install pre-commit || true
	pre-commit install || true
	pre-commit autoupdate || true
	pre-commit install --install-hooks || true
	pre-commit install --hook-type commit-msg || true


# Build and install dependencies using uv/hatchling
.PHONY: build
build:
	@echo "== Building package with hatchling =="
	uv pip install -e '.[dev,test]'
	python -m build --wheel

# Test out the build
.PHONY: test
test:
	@echo "== Running tests =="
	pytest $(TEST_DIR) -v || (echo "Tests failed" && exit 1)


# Clean build artifacts
.PHONY: clean
clean:
	@echo "== Cleaning DIST_DIR and build artifacts =="
	rm -rf $(DIST_DIR)
	rm -rf *.egg-info
	rm -rf build


# Package Development Build
.PHONY: dev
dev: build
	@echo "== Development environment ready =="


.PHONY: lint
lint:
	@echo "== Running Linting ==="
	ruff check $(SRC_DIR) $(TEST_DIR)

.PHONY: format
format:
	@echo "== Running Formatting ==="
	black --check $(SRC_DIR) $(TEST_DIR)

.PHONY: fix
fix: lint-fix format-fix

.PHONY: lint-fix
lint-fix:
	@echo "== Running Linting (auto-fix) ==="
	ruff check --fix $(SRC_DIR) $(TEST_DIR)

.PHONY: format-fix
format-fix:
	@echo "== Running Formatting (auto-fix) ==="
	black $(SRC_DIR) $(TEST_DIR)