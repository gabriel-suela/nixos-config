{ pkgs, ... }:
{
  services.xserver = {
    enable = true;
    displayManager = {
      gdm.enable = true;
      defaultSession = "none+i3";
      sessionCommands = ''
        ${pkgs.xorg.xrdb}/bin/xrdb -merge <${pkgs.writeText "Xresources" ''
        Xcursor.theme: Adwaita
        Xft.dpi: 90
        Xcursor.size: 16
        ''}
      '';
    };
    desktopManager = {
      gnome.enable = true;
      xterm.enable = false;
    };
    videoDrivers = [ "nvidia" ];
    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [
        dmenu
        feh
        dunst
        picom
        polybar
        i3blocks
        lxappearance
        pavucontrol
      ];
    };
  };

  services.printing.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
}



