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
    python311
    ripgrep
    keybase
    keybase-gui
    appimage-run
    jq
    tmux
    python311Packages.pip

    # work
    kubectl
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
    signing.key = "C89FF184D4033338";
    signing.signByDefault = true;
  };


  programs.home-manager.enable = true;

}
