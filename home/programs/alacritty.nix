{ config, pkgs, lib, ... }: {
  home.packages = lib.optionals config.programs.alacritty.enable [ pkgs.nerdfonts ];

  programs.alacritty = {
    enable = true;
    settings = {
      shell.program = "zsh";
      shell.args = [
        "-l"
        "-c"
        "tmux attach || tmux "
      ];

      env = {
        TERM = "xterm-256color";
      };

      window = {
        dynamic_title = false;
        dynamic_padding = true;
      };


      scrolling = {
        history = 10000;
        multiplier = 3;
      };

      font = {
        size = 10;
        normal = {
          family = "JetBrains Mono Nerd Font";
          style = "Regular";
        };
        bold = {
          family = "JetBrains Mono Nerd Font";
          style = "Bold";
        };
        italic = {
          family = "JetBrains Mono Nerd Font";
          style = "Italic";
        };
        bold_italic = {
          family = "JetBrains Mono Nerd Font";
          style = "Italic";
        };
      };

      selection = {
        semantic_escape_chars = '',│`|:"' ()[]{}<>'';
        save_to_clipboard = true;
      };

      live_config_reload = true;

    };
  };
}
