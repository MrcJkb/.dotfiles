begin
  set --local AUTOJUMP_PATH $HOME/.autojump/share/autojump/autojump.fish
  if test -e "$AUTOJUMP_PATH"
    source "$AUTOJUMP_PATH"
  end
end


fish_vi_key_bindings

# # Start X at login
# if status is-login
#   if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
#     # xrandr --newmode "5120x1440_30.00"  293.23  5120 5360 5896 6672  1440 1441 1444 1465  -HSync +Vsync
#     # xrandr --addmode DP1 "5120x1440_30.00"
#     exec startx -- -keeptty
#   end
#   # Set keymap to us altgr-intl if Atreus is connected
#   set -l atreus_output (lsusb | grep Atreus)
#   if test -n "$atreus_output"
#     setxkbmap us altgr-intl
#   end
# end

bass source $HOME/.profile
#bass source $HOME/.sdkman/bin/sdkman-init.sh
set --local NIX_DAEMON = /etc/profile.d/nix{,-daemon}.sh
if test -e "$NIX_DAEMON"
  bass source "$NIX_DAEMON"
end
# set fish_greeting ""

# Starship theme (requires starship)
starship init fish | source
# neofetch --disable cpu gpu
#
fish-nix-shell --info-right | source
zoxide init fish | source
