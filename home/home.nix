{ pkgs, ... }:

{
  imports = [
    ./programs/alacritty.nix
    ./programs/zsh.nix
    ./programs/tmux.nix
    ./programs/dunst.nix
    ./programs/picom.nix
  ];

  home = {
    username = "suela";
    homeDirectory = "/home/suela";
    stateVersion = "23.11";
  };

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
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
    stremio
    appimage-run
    jq
    yq-go
    fluent-gtk-theme
    gruvbox-gtk-theme
    k9s
    go
    tmux
    python311Packages.pip
    google-chrome
    vscode
    flameshot
    libnotify
    xfce.thunar
    fluent-icon-theme
    argocd

    # work
    kubectl
    kind
    krew
    micromamba
    go-task
    (google-cloud-sdk.withExtraComponents [ google-cloud-sdk.components.gke-gcloud-auth-plugin ])
    dbeaver

    kubernetes-helm
    helmfile
    kustomize
    docker
    docker-compose
    sops
  ]);

  home.sessionVariables = {
    EDITOR = "nvim";
    #GTK_THEME = "Gruvbox-Dark-B-LB";
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
