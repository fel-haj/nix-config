{ lib, pkgs, darwin, ... }:
{
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    # utils
    fzf
    ripgrep
    tmux

    # dev
    nodejs_23

    # devops
    terraform
  ] ++ (lib.optionals (darwin) [

  ]) ++ (lib.optionals (!darwin) [
    # apps
    discord
    firefox
    teams-for-linux

    # utils
    clang

    # WM
    brightnessctl
    libnotify
    nautilus
    networkmanagerapplet
    wl-clipboard
  ]);
}
