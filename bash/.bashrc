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

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

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

open() {
  nohup xdg-open "$1" >/dev/null 2>&1 &
  disown
}

git() {
  if [[ "$1" == "clone" && "$2" == rpi:* ]]; then
    local repo="${2#rpi:}"
    command git clone "rpi:/media/ssd0/repos/$repo" "${@:3}"
  else
    command git "$@"
  fi
}
search-text() {
  local result
  local key
  local file
  local line
  local glob="${1:+*.$1}"

  if [[ -n "$glob" ]]; then
    result=$(
      fzf --ansi --disabled \
        --bind "change:reload:rg --line-number --no-heading --color=never --smart-case --glob '$glob' {q} . | cut -d: -f1-2 || true" \
        --delimiter ':' \
        --preview 'bat --color=always --style=numbers --highlight-line {2} {1}' \
        --expect=enter,ctrl-d
    )
  else
    result=$(
      fzf --ansi --disabled \
        --bind "change:reload:rg --line-number --no-heading --color=never --smart-case {q} . | cut -d: -f1-2 || true" \
        --delimiter ':' \
        --preview 'bat --color=always --style=numbers --highlight-line {2} {1}' \
        --expect=enter,ctrl-d
    )
  fi

  [[ -z "$result" ]] && return

  key=$(head -n1 <<<"$result")
  result=$(tail -n1 <<<"$result")

  file="${result%%:*}"
  line="${result#*:}"

  case "$key" in
  enter)
    "${EDITOR:-vim}" "+$line" "$file"
    ;;

  ctrl-d)
    cd -- "$(dirname -- "$file")"
    ;;
  esac
}
# opencode
export PATH=/home/datadiego/.opencode/bin:$PATH
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
eval "$(starship init bash)"
eval "$(zoxide init bash)"
export TRY_PATH=~/Documentos/tries
eval "$(try init)"
