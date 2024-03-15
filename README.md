<p align="center">
  <a href="https://nixos.org#gh-light-mode-only">
    <img src="https://raw.githubusercontent.com/NixOS/nixos-homepage/master/logo/nixos-hires.png" width="500px" alt="NixOS logo"/>
  </a>
  <a href="https://nixos.org#gh-dark-mode-only">
    <img src="https://raw.githubusercontent.com/NixOS/nixos-artwork/master/logo/nixos-white.png" width="500px" alt="NixOS logo"/>
  </a>
</p>

</p>
<p align="center">
  <img src="https://img.shields.io/static/v1?label=Nix Flake&message=Check&style=flat&logo=nixos&colorA=24273A&colorB=9173ff&logoColor=CAD3F5">
  <a href="https://nixos.org/"><img src="https://img.shields.io/badge/NixOS-Unstable-informational.svg?style=flat&logo=nixos&logoColor=CAD3F5&colorA=24273A&colorB=8AADF4"></a> 
</p>


## Instructions

```bash
$ git clone https://github.com/gabriel-suela/nixos-config ~/.dotfiles | cd ~/.dotfiles
$ sudo nixos-rebuild switch --flake .
```

## Run home-manager setup

```bash
$ home-manager switch --flake .
```
