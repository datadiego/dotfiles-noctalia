function _navi_call
    command navi $argv </dev/tty
end

function _navi_widget
    set -l input (commandline)
    set -l last_command (printf '%s\n' "$input" | navi fn widget::last_command)

    if test -z "$last_command"
        set -l output (_navi_call --print)
    else
        set -l find "$last_command""_NAVIEND"
        set -l replacement (_navi_call --print --query "$last_command")
        set -l output "$input"
        if test -n "$replacement"
            set output (string replace -- "$find" "$replacement" "$input""_NAVIEND")
        end
    end

    commandline --replace -- "$output"
end