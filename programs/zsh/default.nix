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
      enableAutosuggestions = true;
      enableCompletion = true;
      enableSyntaxHighlighting = true;
    };
  };

  home.file.".zshrc".text = ''
    ZSH_THEME="refined"
    REFINED_CHAR_SYMBOL="⚡"
  '';
}

