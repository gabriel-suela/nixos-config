{ pkgs, ... }:
{
  programs.fuzzel = {
    enable = true;
    settings = {
      colors.background = "#161616d4";
      colors.text = "#E2E0ECCC";
      colors.selection-text = "#161616CC";
      colors.selection-match = "#ECE0A8CC";
      colors.match = "#ECE0A8CC";
      colors.selection = "#78afe3CC";
      colors.border = "#78afe3CC";
      border.radius = 10;
      border.width = 2;
      main.width = 60;
      main.font = "JetBrains Mono Nerd Font:size=12";
      main.prompt = "❯ ";
    };
  };
}
