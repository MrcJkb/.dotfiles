{ config, pkgs, ... }:

{
  home = {
    username = "mrcjk";
    homeDirectory = "/home/mrcjk";

    # This value determines the Home Manager release that your
    # configuration is compatible with. This helps avoid breakage
    # when a new Home Manager release introduces backwards
    # incompatible changes.
    #
    # You can update Home Manager without changing this value. See
    # the Home Manager release notes for a list of state version
    # changes in each release.
    stateVersion = "22.05";
  };

  programs = {
    fish = {
      # enable = true;
      shellAliases = {
        bd="prevd";
        nd="nextd";
        gradle="gw";
        exa="exa --icons --git";
        ls="exa --icons --git";
        la="exa --icons --git -a";
        ll="ls --icons --git -l";
        lt="ls --icons --tree";
        ltg="lt --git";
        lta="lt -a";
        ltl="lt -l";
        lla="ls --icons --git -al";
        grep="rg";
        cat="bat --style=plain";
        code="codium";
        config="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME";
        win10="./$HOME/sh/wi10.sh";
        mbsync="mbsync -c $XDG_CONFIG_HOME/isync/mbsyncrc";
        nvim-rebuild="rm ~/.cache/paru/clone/neovim-nightly-bin/ -rf && paru --rebuild --redownload neovim-nightly-bin";
      };
      shellInit = ''
        fish_vi_key_bindings
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
        begin
          set --local AUTOJUMP_PATH $HOME/.autojump/share/autojump/autojump.fish
          if test -e "$AUTOJUMP_PATH"
            source "$AUTOJUMP_PATH"
          end
        end
        bass source $HOME/.profile
        bass source $HOME/.sdkman/bin/sdkman-init.sh
        bass source /etc/profile.d/nix{,-daemon}.sh
        starship init fish | source
      '';
      plugins = [
        {
          name = "bass";
          src = pkgs.fetchFromGitHub {
            owner = "edc";
            repo = "bass";
            rev = "HEAD";
            sha256 = "fl4/Pgtkojk5AE52wpGDnuLajQxHoVqyphE90IIPYFU=";
          };
        }
        {
          name = "battery";
          src = pkgs.fetchFromGitHub {
            owner = "oh-my-fish";
            repo = "plugin-battery";
            rev = "HEAD";
            sha256 = "nzCPhOme2GUed1Zo6+CS3VGA5retk3I/mNGvHn8OPN8=";
          };
        }
      ];
      functions = {
        fish_greeting.body = "";
        haskellEnv = {
          description = "Invocation: haskellEnv package1 package2 .. packageN";
          body = "nix-shell -p \"haskellPackages.ghcWithPackages (pkgs: with pkgs; [ $argv ])\"";
        };
      };
    };
    starship.enable = true;
    # Let Home Manager install and manage itself.
    home-manager.enable = true;
  };
}
