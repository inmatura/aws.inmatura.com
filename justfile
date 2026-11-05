default:
  just --list

build:
  uv run mkdocs build -d dist

serve:
  uv run mkdocs serve
