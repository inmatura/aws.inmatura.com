default:
  just --list

build:
  mkdocs build -d dist

lockfiles:
  pip-compile -q --resolver=backtracking -o requirements.txt pyproject.toml

serve:
  mkdocs serve
