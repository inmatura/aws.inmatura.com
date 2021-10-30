SHELL := bash
.ONESHELL:
.SHELLFLAGS := -eu -o pipefail -c
.DELETE_ON_ERROR:
MAKEFLAGS += --warn-undefined-variables
MAKEFLAGS += --no-builtin-rules
.DEFAULT_GOAL := help


all: build


# ------------------------------------------------------------------------------
# Python

env:  ## Create virtualenv
	poetry install


build:  ## mkdocs build
	rm -rf $(CURDIR)/site;
	mkdocs build

docs: build
.PHONY: docs


serve:  ## Serve docs
	mkdocs serve


# ------------------------------------------------------------------------------
# Other

clean: ## Clean build
	rm -rf $(CURDIR)/site


reset: clean  ## Reset everything
	rm -rf $(CURDIR)/.env


help:  ## Show this help menu
	@grep -E '^[0-9a-zA-Z_-]+:.*?##.*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?##"; OFS="\t\t"}; {printf "\033[36m%-30s\033[0m %s\n", $$1, ($$2==""?"":$$2)}'
