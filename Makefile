SHELL = /bin/bash

ifeq (, $(shell which shellcheck))
$(error "Failed! Could not find shellcheck.")
endif

.PHONY: check
check:
	@shellcheck --shell=bash zsh/.zshenv
	@shellcheck --shell=bash --exclude=SC1091 zsh/.config/zsh/.zshrc
	@shellcheck --shell=bash --exclude=SC1091 zsh/.config/zsh/*.zsh
