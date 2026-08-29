SHELL := /bin/bash

PACKAGES := hyprland niri bash nvim noctalia btop opencode ruby
#PHONY hace que siempre se ejecute la accion asociada en el Makefile
.PHONY: help install install-dependencies fedora-hacking git-config stow post-install check-sudo stow-% unstow unstow-% clean

help:
	@cat logo
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2}'

check-sudo: ## Solicita sudo una sola vez al inicio
	@sudo -v

install: check-sudo git-config install-dependencies stow post-install clean ## Instalar dependencias y dotfiles

install-dependencies:
	@bash scripts/dependencies.sh

fedora-hacking: ## Herramientas de hacking y ciberseguridad para fedora
	@bash scripts/cybsec-tools-fedora.sh

git-config:
	@bash scripts/git-config.sh

stow:
	@rm -f ~/.bashrc
	@rm -rf ~/.config/nvim
	@rm -rf ~/.config/noctalia
	@for pkg in $(PACKAGES); do \
		echo "Stowing $$pkg..."; \
		stow -S "$$pkg"; \
	done

post-install:
	@sudo cp ./user-scripts/launch-terminal /usr/local/bin/
	@sudo cp ./user-scripts/terminal-cwd /usr/local/bin/

stow-%:
	@echo "Stowing $*..."
	@stow -v "$*"

unstow:  ## Unstow todos los paquetes
	@for pkg in $(PACKAGES); do \
		echo "Unstowing $$pkg..."; \
		stow -v -D "$$pkg"; \
	done

unstow-%:  ## Unstow un paquete específico (ej: make unstow-alacritty)
	@echo "Unstowing $*..."
	@stow -v -D "$*"

clean:  ## Limpia archivos generados
	@rm -f *.zip
	@echo "Archivos generados eliminados"
