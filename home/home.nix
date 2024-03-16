{ pkgs, ... }:

{
  imports = [
    ./programs/alacritty.nix
    ./programs/zsh.nix
    ./programs/tmux.nix
    ./programs/picom.nix
    ./programs/rofi.nix
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
    alacritty
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
    stremio
    materia-theme
    fzf
    zoxide


    # Screenshot and recording tools
    flameshot
    simplescreenrecorder

    # File and system utilities
    libnotify
    xdg-utils
    yad

    # work
    kubectl
    kind
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
    NIXOS_OZONE_WL = "1";
  };

  nixpkgs.config = {
    packageOverrides = pkgs: rec {
      polybar = pkgs.polybar.override {
        i3Support = true;
        alsaSupport = true;
        pulseSupport = true;
      };
    };
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
