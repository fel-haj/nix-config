{ config, lib, pkgs, darwin, ... }:
{
  imports = [
    ./packages.nix

    ./modules/direnv.nix
    ./modules/eza.nix
    ./modules/ghostty.nix
    ./modules/git.nix
    ./modules/go.nix
    ./modules/neovim.nix
    ./modules/starship.nix
    ./modules/symlinks.nix
    ./modules/yazi.nix
    ./modules/zsh.nix
  ] ++ (lib.optionals (!darwin) [
    ./modules/stylix.nix
    ./modules/hyprland
    ./modules/waybar
    ./modules/wofi
  ]);

  home = {
    stateVersion = "24.11";
  };

  xdg.enable = true;
}
