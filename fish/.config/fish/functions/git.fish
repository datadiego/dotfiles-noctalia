function git
    if test "$argv[1]" = "clone"
        and string match -q 'rpi:*' -- "$argv[2]"
        command git clone "rpi:/media/ssd0/repos/"(string replace -r '^rpi:' '' -- "$argv[2]") $argv[3..-1]
    else
        command git $argv
    end
end