.DEFAULT_GOAL := help

.PHONY: help test lint format ruff-check ruff-format mypy isort-check isort-format

help:
	@echo "test [TEST=path]   pytest. TEST puede ser un fichero, una carpeta o un nodo (fichero::test)."
	@echo "lint               ruff-check, isort-check y mypy, en ese orden."
	@echo "format             ruff-format e isort-format, en ese orden."
	@echo "ruff-check         ruff check y ruff format --check. Falla si hay errores."
	@echo "ruff-format        ruff check --fix y ruff format."
	@echo "isort-check        isort --check-only. Falla si los imports no estan ordenados."
	@echo "isort-format       isort."
	@echo "mypy               mypy."

# make test
# make test TEST=tests
# make test TEST=tests/test_example.py
# make test TEST=tests/test_example.py::test_true
test:
	uv run pytest $(TEST)

lint: ruff-check isort-check mypy

format: ruff-format isort-format

ruff-check:
	uv run ruff check .
	uv run ruff format --check .

ruff-format:
	uv run ruff check --fix .
	uv run ruff format .

isort-check:
	uv run isort --check-only --diff .

isort-format:
	uv run isort .

mypy:
	uv run mypy
