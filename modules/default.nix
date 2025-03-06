{ lib, darwin, ... }
{
  imports = [
    ./fonts.nix
    ./network.nix
    ./settings.nix
  ]  ++ (lib.optionals (darwin) [
    ./homebrew.nix
  ]  ++ (lib.optionals (!darwin) [
    ./hyprland.nix
    ./stylix.nix
    ./user.nix
  ];
}
