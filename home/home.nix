{ pkgs, ... }:

{
  imports = [
    ./programs/alacritty.nix
    ./programs/zsh.nix
    ./programs/tmux.nix
    ./programs/picom.nix
    ./programs/rofi.nix
    ./programs/fuzzel.nix
    ./programs/appearance.nix
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
    tmux-sessionizer

    #wm-stuff
    feh
    dunst
    picom
    i3
    dmenu
    i3status
    polybar
    waybar
    fuzzel
    nwg-look
    hyprpaper

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
    GBM_BACKEND = "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    LIBVA_DRIVER_NAME = "nvidia"; # hardware acceleration
    __GL_VRR_ALLOWED = "1";
    WLR_NO_HARDWARE_CURSORS = "1";
    WLR_RENDERER_ALLOW_SOFTWARE = "1";
    CLUTTER_BACKEND = "wayland";
    WLR_RENDERER = "vulkan";
    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_DESKTOP = "Hyprland";
    XDG_SESSION_TYPE = "wayland";
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
