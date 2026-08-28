git() {
  if [[ "$1" == "clone" && "$2" == rpi:* ]]; then
    local repo="${2#rpi:}"
    command git clone "rpi:/media/ssd0/repos/$repo" "${@:3}"
  else
    command git "$@"
  fi
}
