{ config, pkgs, ... }:

{
  services.xserver = {
    videoDrivers = [ "nvidia" ];
    enable = true;
    layout = "us";
    xkbVariant = "intl";
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

  services.printing.enable = true;

  environment.pathsToLink = [ "/libexec" ]; # links /libexec from derivations to /run/current-system/sw 

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
}
