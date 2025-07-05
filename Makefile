
# Package/project config
PACKAGE_DIR := py_zerox
SRC_DIR := $(PACKAGE_DIR)/pyzerox
TEST_DIR := $(PACKAGE_DIR)/tests
DIST_DIR := $(PACKAGE_DIR)/dist

# Default target
.PHONY: all
all: build test dev


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