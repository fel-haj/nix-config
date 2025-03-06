{ lib, pkgs, darwin, ... }:
{
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    # utils
    fzf
    ripgrep
    tmux

    # collaboration
    teams-for-linux
    discord

    # dev
    nodejs_23

    # devops
    terraform
  ] ++ (lib.optionals (darwin) [

  ]) ++ (lib.optionals (!darwin) [
    brightnessctl
    clang
    firefox
    ghostty
    libnotify
    nautilus
    networkmanagerapplet
    wl-clipboard
  ]);
}
