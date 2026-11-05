# Agent Instructions

Documentation website for Inmatura's AWS Marketplace products, built with
MkDocs Material. The README and `justfile` own setup and usage.

## Conventions

- Python 3.13 (pinned in CI), dependencies managed with uv (`pyproject.toml`, `uv.lock`).
- Write content in `docs/`; update `mkdocs.yml` when changing navigation.
  Custom styles and scripts live in `docs/assets/`.
- Keep documentation concise and preserve product links, support information,
  code examples, and existing page paths.
- Run `just build` (`uv run mkdocs build -d dist`) after documentation changes.

## Deployment

GitHub Actions builds `dist/` and deploys static assets to a Cloudflare Worker
using `wrangler.toml`, with production on `main` and previews for pull requests.
