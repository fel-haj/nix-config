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
    powershell
  ]) ++ (lib.optionals (!darwin) [
    clang
    firefox
    ghostty
    kitty
  ]);
}
