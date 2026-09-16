function search-text
    set -l glob "*.*"
    if set -q argv[1]
        set glob "*.$argv[1]"
    end
    set -l reload "rg --line-number --no-heading --color=never --smart-case {q} . | cut -d: -f1-2 || true"
    if test "$glob" != "*.*"
        set reload "rg --line-number --no-heading --color=never --smart-case --glob '$glob' {q} . | cut -d: -f1-2 || true"
    end

    set -l result (fzf --ansi --disabled \
        --bind "change:reload:$reload" \
        --delimiter ':' \
        --preview 'bat --color=always --style=numbers --highlight-line {2} {1}' \
        --expect=enter,ctrl-d,esc)

    test -n "$result[1]"; or return

    set -l key $result[1]
    set -l fileline $result[2]
    set -l parts (string split ':' -- $fileline)
    set -l file $parts[1]
    set -l line $parts[2]

    switch $key
        case enter
            $EDITOR "+$line" $file
        case ctrl-d
            cd (dirname -- $file)
    end
end