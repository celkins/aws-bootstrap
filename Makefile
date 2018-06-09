templates = $(wildcard *-cfn.yaml)

.PHONY: all
all: test

.PHONY: test
test: lint

.PHONY: lint
lint:
	@for template in $(templates); do (cfn-lint --template "$$template") || exit 1 ; done
