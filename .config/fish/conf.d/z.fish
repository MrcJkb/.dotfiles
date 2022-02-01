set unamea (uname -a)

switch $unamea
  case "*arch*" # Arch Linux
    # Assumes the AUR z.lua package has been installed
    source /usr/share/z.lua/init.fish
  case "*nixos*" # NixOS
    z --init fish | source
  end
