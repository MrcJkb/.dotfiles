alias bd="prevd"
alias nd="nextd"
alias gradle="gw"
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
alias code="codium"
alias vim="nvim"
alias te="nvim -c \":te\""
alias config="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
alias win10="./$HOME/sh/wi10.sh"

begin
  set --local AUTOJUMP_PATH $HOME/.autojump/share/autojump/autojump.fish
  if test -e $AUTOJUMP_PATH
    source $AUTOJUMP_PATH
  end
end

function gitCheckPull
  git checkout "$1" && git pull
end

function gitCheckPU
  git checkout "$1" && git pull && git submodule update --init --force --recursive .
end

fish_vi_key_bindings

# Start X at login
if status is-login
  if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
    xmonad --recompile
    exec startx -- -keeptty
  end
  # Set keymap to us altgr-intl if Atreus is connected
  set -l atreus_output (lsusb | grep Atreus)
  if not test -z "$atreus_output"
    setxkbmap us altgr-intl
  end
end

bass source $HOME/.profile
bass source $HOME/.sdkman/bin/sdkman-init.sh
set fish_greeting ""

# neofetch --disable cpu gpu
