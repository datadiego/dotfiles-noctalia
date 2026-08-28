# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
  PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
  for rc in ~/.bashrc.d/*; do
    if [ -f "$rc" ]; then
      . "$rc"
    fi
  done
fi
unset rc

export TERMINAL="alacritty"
export EDITOR="nvim"

eval "$(fzf --bash)"
alias cd="z"
alias n="nvim"
alias c="code"
alias nano="micro"
alias ls="eza -l"

# opencode
export PATH=/home/datadiego/.opencode/bin:$PATH
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
eval "$(starship init bash)"
eval "$(zoxide init bash)"
export TRY_PATH=~/Documentos/tries
eval "$(try init)"
