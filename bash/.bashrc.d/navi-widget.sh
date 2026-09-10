_navi_call() {
   local result="$(navi "$@" </dev/tty)"
   printf "%s" "$result"
}

_navi_widget() {
   local -r input="${READLINE_LINE}"
   local -r last_command="$(echo "${input}" | navi fn widget::last_command)"

   if [ -z "${last_command}" ]; then
      local -r output="$(_navi_call --print)"
   else
      local -r find="${last_command}_NAVIEND"
      local -r replacement="$(_navi_call --print --query "$last_command")"
      local output="$input"
      if [ -n "$replacement" ]; then
         output="${input}_NAVIEND"
         output="${output//$find/$replacement}"
      fi
   fi

   READLINE_LINE="$output"
   READLINE_POINT=${#READLINE_LINE}
}

bind -x '"\C-g": _navi_widget'
