{ lib, darwin, ... }:
{
  imports = [
    # ./fonts.nix
    ./settings.nix
  # ] ++ (lib.optionals (darwin) [
  #   ./homebrew.nix
  # ]) ++ (lib.optionals (!darwin) [
    ./hyprland.nix
    ./network.nix
    ./user.nix
  ];
  # ]);
}
