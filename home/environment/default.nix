{ pkgs, ... }:
{

  environment.shells = with pkgs; [ zsh ];
  environment.systemPackages = with pkgs; [
    neovim
    wget
    git
  ];

  environment.variables = {
    NIXPKGS_ALLOW_UNFREE = "1";
    PATH = [
      "\${HOME}/.local/bin"
      "\${HOME}/.krew/bin"
    ];
  };
}
