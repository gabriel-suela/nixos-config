{ pkgs, ... }:

{
  home.pointerCursor = {
    package = pkgs.bibata-cursors;
    name = "Bibata-cursors";
    gtk.enable = true;
  };

  gtk = {
    enable = true;
    font = {
      name = "JetBrains Mono Nerd Font Regular";
      size = 10;
    };
    iconTheme = {
      package = (pkgs.catppuccin-papirus-folders.override { flavor = "mocha"; accent = "peach"; });
      name = "Papirus-Dark";
    };
    theme = {
      name = "Materia-dark";
      package = pkgs.materia-theme;
    };
  };
}
