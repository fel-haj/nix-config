{ config, lib, pkgs, darwin, ... }:
{
  imports = [
    ./packages.nix

    ./modules/direnv.nix
    ./modules/eza.nix
    # ./modules/ghostty.nix
    ./modules/git.nix
    ./modules/go.nix
    ./modules/neovim.nix
    ./modules/starship.nix
    ./modules/symlinks.nix
    ./modules/yazi.nix
    ./modules/zsh.nix
  ] ++ (lib.optionals (!darwin) [
    # ghostty only for Linux - package broken for darwin
    ./modules/ghostty.nix

    ./modules/stylix.nix
    ./modules/swaync.nix
    ./modules/hyprland
    ./modules/waybar
    ./modules/wofi
  ]);

  home = {
    stateVersion = "24.11";
  };

  xdg.enable = true;
}
