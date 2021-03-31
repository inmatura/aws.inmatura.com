SHELL := bash
.ONESHELL:
.SHELLFLAGS := -eu -o pipefail -c
.DELETE_ON_ERROR:
MAKEFLAGS += --warn-undefined-variables
MAKEFLAGS += --no-builtin-rules

PWD := $(shell pwd)


first: help


# ------------------------------------------------------------------------------
# Python

env:  ## Create virtualenv
	mamba env create


.PHONY: docs
docs: build
build:  ## mkdocs build
	rm -rf $(CURDIR)/site;
	mkdocs build


serve:  ## Serve docs
	mkdocs serve


# ------------------------------------------------------------------------------
# Other

cleanall: clean  ## Reset everything
clean: ## Clean build
	rm -rf $(CURDIR)/site


help:  ## Show this help menu
	@grep -E '^[0-9a-zA-Z_-]+:.*?##.*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?##"; OFS="\t\t"}; {printf "\033[36m%-30s\033[0m %s\n", $$1, ($$2==""?"":$$2)}'
