{ config, pkgs, ... }:
{
  programs = {
    zsh = {
      enable = true;
      oh-my-zsh = {
        enable = true;
        theme = "refined";
        plugins = [
          "git"
        ];
      };
      enableCompletion = true;
      enableAutosuggestions = true;
      syntaxHighlighting.enable = true;
    };
  };

  home.file.".zshrc".text = ''
    export PATH="$HOME/.krew/bin:$PATH"
    export XDG_DATA_DIRS=$XDG_DATA_DIRS:/usr/share:/var/lib/flatpak/exports/share:$HOME/.local/share/flatpak/exports/share
    eval "$(zoxide init zsh)"
    alias z="zoxide"

  '';
}

