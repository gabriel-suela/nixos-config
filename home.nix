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

  home.packages = (with pkgs; [
    zsh
    alacritty
    git
    xclip
    gh
    gcc
    nodejs
    cargo
    lazygit
    python312
    ripgrep
    keybase
    keybase-gui
    appimage-run
    jq
    tmux

    # work
    kubectl
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
    #signing.key = "C89FF184D4033338";
    #signing.signByDefault = true;
  };


  programs.home-manager.enable = true;

}
