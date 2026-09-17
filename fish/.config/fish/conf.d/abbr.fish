abbr -a gl 'git log --oneline'
abbr -a gc "git add .; and git commit -m"
abbr -a qr "qrencode -t UTF8 -m 3"
abbr -a subs --set-cursor "sed 's/%/new/g'"
abbr -a --set-cursor=% del "sed '/%/d'"
abbr -a --set-cursor=% awk "awk '{print \$%}'"
abbr -a --set-cursor=% sqlex 'sqlite3 test.db < %.sql'
abbr -a --set-cursor=% sqlall 'sqlite3 test.db "SELECT * FROM %"'
abbr -a --set-cursor=% sqlget 'sqlite3 test.db "SELECT * FROM % WHERE id = "'
abbr -a --set-cursor=% sqlins 'sqlite3 test.db "INSERT INTO %(c) VALUES (v)"'
abbr -a --set-cursor=% sqlupd 'sqlite3 test.db "UPDATE % SET c = v WHERE id = "'
abbr -a --set-cursor=% sqldel 'sqlite3 test.db "DELETE FROM % WHERE id = "'
abbr -a --set-cursor=% sqldrop 'sqlite3 test.db "DROP TABLE %"'
abbr -a --set-cursor=% sqltables 'sqlite3 %.db ".tables"'
abbr -a --set-cursor=% sqlschema 'sqlite3 test.db ".schema %"'
abbr -a --set-cursor=% sqlinfo 'sqlite3 test.db "PRAGMA table_info(%);"'
abbr -a --set-cursor=% sqlindexes 'sqlite3 test.db "PRAGMA index_list(%);"'
abbr -a --set-cursor=% sqlorder 'sqlite3 test.db "SELECT * FROM % ORDER BY "'
