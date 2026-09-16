function try
    set -l out (/usr/bin/env ruby '/home/datadiego/.local/share/gem/ruby/gems/try-cli-1.10.1/try.rb' exec --path "$TRY_PATH" $argv 2>/dev/tty)
    if test $status -eq 0
        eval "$out"
    end
end