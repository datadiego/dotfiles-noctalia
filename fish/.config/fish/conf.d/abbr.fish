abbr -a gl 'git log --oneline'
abbr -a gc "git add .; and git commit -m"
abbr -a qr "qrencode -t UTF8 -m 3"
abbr -a subs --set-cursor "sed 's/%/new/g'"
abbr -a --set-cursor=% del "sed '/%/d'"
abbr -a --set-cursor=% awk "awk '{print \$%}'"
