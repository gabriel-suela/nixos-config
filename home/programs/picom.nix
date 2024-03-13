{ pkgs, ... }:

{
  services.picom = {
    enable = true;

    activeOpacity = 1;
    inactiveOpacity = 1;
    fade = true;
    backend = "glx";
    vSync = true;

  };
}
