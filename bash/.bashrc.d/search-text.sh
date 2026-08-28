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
