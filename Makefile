SHELL := /bin/bash

PACKAGES := hyprland niri bash nvim noctalia btop opencode ruby
#PHONY hace que siempre se ejecute la accion asociada en el Makefile
.PHONY: help install common coding hacking hacking-tools dev-tools install-dependencies install-noctalia git-config stow post-install check-sudo unstow clean

help:
	@cat logo
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2}'

check-sudo:
	@sudo -v

install: check-sudo git-config install-dependencies install-noctalia stow post-install clean ## Instalar dependencias y dotfiles
coding: check-sudo dev-tools ## Herramientas de desarrollo
hacking: hacking-tools ## Herramientas de pentesting

common: check-sudo git-config install-dependencies install-noctalia stow post-install clean ## Paquetes básicos

hacking-tools:
	@bash scripts/cybsec-tools.sh

dev-tools:
	@bash scripts/dev-tools.sh

install-dependencies:
	@bash scripts/common.sh

install-noctalia:
	@bash scripts/noctalia.sh


git-config:
	@bash scripts/git-config.sh

stow:
	@rm -f ~/.bashrc
	@rm -rf ~/.config/nvim
	@rm -rf ~/.config/noctalia
	@rm -rf ~/.gemrc
	@for pkg in $(PACKAGES); do \
		echo "Stowing $$pkg..."; \
		stow -S "$$pkg"; \
	done

post-install:
	@sudo cp ./user-scripts/launch-terminal /usr/local/bin/
	@sudo cp ./user-scripts/terminal-cwd /usr/local/bin/

unstow:
	@for pkg in $(PACKAGES); do \
		echo "Unstowing $$pkg..."; \
		stow -v -D "$$pkg"; \
	done

clean:
	@rm -f *.zip
	@echo "Archivos generados eliminados"
