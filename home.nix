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
    fluent-gtk-theme
    k9s
    go
    tmux
    python311Packages.pip

    # gnome
    gnomeExtensions.blur-my-shell
    gnomeExtensions.compact-top-bar
    gnomeExtensions.tray-icons-reloaded
    gnome.gnome-tweaks
    gnomeExtensions.just-perfection
    gnomeExtensions.vitals

    # work
    kubectl
    krew
    micromamba
    go-task
    (google-cloud-sdk.withExtraComponents [ google-cloud-sdk.components.gke-gcloud-auth-plugin ])

    kubernetes-helm
    helmfile
    kustomize
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
