{
  imports = [
    ./hyprland.nix
    ./network.nix
    ./services.nix
    ./user.nix
  ];

  nix = {
    settings.experimental-features = "nix-command flakes";
    gc = {
      automatic = true;
      options = "--delete-older-than 14d";
      dates = "weekly";
    };
  };
}
