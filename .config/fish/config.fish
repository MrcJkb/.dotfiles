if status is-interactive
    # Commands to run in interactive sessions can go here
    alias cd="z"
    alias bd="prevd"
    alias nd="nextd"
    alias exa="exa --icons --git"
    alias ls="exa --icons --git"
    alias la="exa --icons --git -a"
    alias ll="ls --icons --git -l"
    alias lt="ls --icons --tree"
    alias ltg="lt --git"
    alias lta="lt -a"
    alias ltl="lt -l"
    alias lla="ls --icons --git -al"
    alias grep="rg"
    alias cat="bat --style=plain"
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
