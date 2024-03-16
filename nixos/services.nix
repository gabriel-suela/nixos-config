{ config, pkgs, ... }:

{
  services.xserver = {
    enable = true;
    videoDrivers = [ "nvidia" ];
    displayManager.gdm = {
      enable = true;
    };
    desktopManager.gnome = {
      enable = true;
    };
    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [
        dmenu
        feh
        dunst
        picom
        polybar
        i3status
        i3lock
        i3blocks
        lxappearance
        pavucontrol
        xfce.thunar
        lf
      ];
    };
  };

  environment.gnome.excludePackages = (with pkgs; [
    gnome-photos
    gnome-tour
    gedit
  ]) ++ (with pkgs.gnome; [
    cheese # webcam tool
    gnome-music
    gnome-terminal
    epiphany # web browser
    geary # email reader
    evince # document viewer
    gnome-characters
    totem # video player
    tali # poker game
    iagno # go game
    hitori # sudoku game
    atomix # puzzle game
  ]);

  programs.dconf.enable = true;

  services.flatpak.enable = true;

  services.printing.enable = true;

  environment.pathsToLink = [ "/libexec" ]; # links /libexec from derivations to /run/current-system/sw 

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    wireplumber.enable = true;
    pulse.enable = true;
  };
}
