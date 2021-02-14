SHELL := bash
.ONESHELL:
.SHELLFLAGS := -eu -o pipefail -c
.DELETE_ON_ERROR:
MAKEFLAGS += --warn-undefined-variables
MAKEFLAGS += --no-builtin-rules

PWD := $(shell pwd)
PYTEST_K ?= ""
TEST_MARKERS ?= "not selenium"

SELENIUM_HUB_HOST ?= 127.0.0.1
SELENIUM_HUB_PORT ?= 4444
PYTEST_BASE_URL ?= http://host.docker.internal:8866


first: help


env:  ## Create virtualenv
	mamba env create


.PHONY: docs
docs: build
build:  ## mkdocs build
	rm -rf $(CURDIR)/site;
	mkdocs build


serve:  ## Serve docs
	mkdocs serve


reset: clean  ## Reset everything
clean: ## Clean build
	rm -rf $(CURDIR)/site


help:  ## Show this help menu
	@grep -E '^[0-9a-zA-Z_-]+:.*?##.*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?##"; OFS="\t\t"}; {printf "\033[36m%-30s\033[0m %s\n", $$1, ($$2==""?"":$$2)}'
