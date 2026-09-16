if functions -q bass
    function __load_nvm
        bass source "$NVM_DIR/nvm.sh"
        functions -e __load_nvm
    end
    for cmd in nvm node npm npx corepack
        eval "function $cmd; __load_nvm; $cmd \$argv; end"
    end

    function __load_sdkman
        bass source "$SDKMAN_DIR/bin/sdkman-init.sh"
        functions -e __load_sdkman
    end
    function sdk
        __load_sdkman
        sdk $argv
    end
end