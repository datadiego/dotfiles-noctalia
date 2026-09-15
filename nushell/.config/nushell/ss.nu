export def main [] {
    ^ss -tuanpH
    | lines
    | each { |line|
        let f = ($line | split row -r '\s+')

        let local = ($f | get 4)
        let peer = ($f | get 5)

        let local_parsed = if ($local | str starts-with '[') {
            $local
            | parse -r '^\[(?<address>.*)\]:(?<port>.*)$'
            | get 0
        } else {
            $local
            | parse -r '^(?<address>.*):(?<port>[^:]*)$'
            | get 0
        }

        let peer_parsed = if ($peer | str starts-with '[') {
            $peer
            | parse -r '^\[(?<address>.*)\]:(?<port>.*)$'
            | get 0
        } else {
            $peer
            | parse -r '^(?<address>.*):(?<port>[^:]*)$'
            | get 0
        }

        let process = if (($f | length) > 6) {
            $f
            | skip 6
            | str join ' '
        } else {
            ""
        }

        {
            protocol: ($f | get 0)
            state: ($f | get 1)
            recv_q: (($f | get 2) | into int)
            send_q: (($f | get 3) | into int)
            local_address: ($local_parsed | get address)
            local_port: ($local_parsed | get port)
            peer_address: ($peer_parsed | get address)
            peer_port: ($peer_parsed | get port)
            process: $process
        }
    }
}
