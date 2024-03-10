{ config, pkgs, ... }:

{
  imports = [
    ./programs
  ];
  home.username = "suela";
  home.homeDirectory = "/home/suela";
  home.stateVersion = "23.11"; # Please read the comment before changing.

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

  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      ll = "ls -l";
      ".." = "cd ..";
    };
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "robbyrussell";
    };
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
