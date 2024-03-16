{ pkgs, ... }:
{

  users.defaultUserShell = pkgs.zsh;

  users.users.suela = {
    isNormalUser = true;
    description = "suela";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    packages = with pkgs; [
      firefox
      neofetch
    ];
  };
}
