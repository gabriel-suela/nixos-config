{ pkgs, ... }:

{
  services.picom = {
    enable = true;
    activeOpacity = 1;
    inactiveOpacity = 1;
    fade = false;
    backend = "xrender";
    vSync = true;
    shadow = false;

  };
}
