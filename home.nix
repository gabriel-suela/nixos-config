{ config, pkgs, ... }:

{
  imports = [
    ./programs
  ];

  home = {
    username = "suela";
    homeDirectory = "/home/suela";
    stateVersion = "23.11";
  };

  nix = {
    package = pkgs.nix;
    settings.experimental-features = [ "nix-command" "flakes" ];
  };

  home.packages = (with pkgs; [
    zsh
    alacritty
    git
    xclip
    gnumake
    unzip
    gh
    gcc
    nodejs
    cargo
    lazygit
    python311
    ripgrep
    keybase
    keybase-gui
    appimage-run
    jq
    yq-go
    k9s
    go
    tmux
    python311Packages.pip

    # work
    kubectl
    krew
    micromamba
    go-task
    kubernetes-helm
    helmfile
    kustomize
    google-cloud-sdk
    docker
    docker-compose
    sops
  ]);

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.git = {
    enable = true;
    userEmail = "gscsuela@gmail.com";
    userName = "gabriel-suela";
    signing.key = "D4033338";
    signing.signByDefault = true;
  };


  programs.home-manager.enable = true;

}
