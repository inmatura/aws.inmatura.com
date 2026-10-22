# aws.inmatura.com

[![build](https://github.com/inmatura/aws.inmatura.com/actions/workflows/deploy.yml/badge.svg)](https://github.com/inmatura/aws.inmatura.com/actions/workflows/deploy.yml)

Documentation for Inmatura's AWS Marketplace products, built with MkDocs Material.

## Development

Use Python 3.11 to match CI.

```zsh
python3 -m venv .venv
source .venv/bin/activate
python -m pip install -r requirements.txt
mkdocs serve
```

Open [localhost:8000](http://localhost:8000). Content lives in `docs/`;
navigation and site settings live in `mkdocs.yml`.

## Build and deployment

```zsh
mkdocs build -d dist
```

With just installed, `just serve` and `just build` run the same commands.
GitHub Actions builds `dist/` and deploys it to a Cloudflare Worker with
Wrangler. Pushes to `main` deploy production; pull requests get previews.
