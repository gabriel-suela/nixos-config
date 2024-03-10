{ config, pkgs, lib, ... }: {
  home.packages = lib.optionals config.programs.alacritty.enable [ pkgs.nerdfonts ];

  programs.alacritty = {
    enable = true;

    settings = {
      font = {
        normal = {
          family = "JetBrains Mono Nerd Font";
          style = "Medium";
        };
        size = 10;
      };
    };
  };
}
