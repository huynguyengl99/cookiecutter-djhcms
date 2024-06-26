#!/usr/bin/env bash

if [ -d ".venv" ]; then
    source .venv/bin/activate
fi

if [ "$1" == "--fix" ]; then
  ruff check . --fix && black ./{{cookiecutter.project_slug}} && toml-sort pyproject.toml --all --in-place
else
  ruff check . && black ./{{cookiecutter.project_slug}} --check && toml-sort pyproject.toml --all --in-place --check
fi
