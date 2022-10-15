if status is-interactive
    if test -e "$NVIM_LISTEN_ADDRESS"
        alias nvim="nvr"
        alias vim="nvr"
        alias vi="nvr"
        alias te="nvr -c \":te\""
    else
        alias vim="nvim"
        alias vi="nvim"
        alias te="nvim -c \":te\""
    end
end
