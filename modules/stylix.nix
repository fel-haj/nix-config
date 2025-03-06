{
  stylix = {
    enable = true;
    image = pkgs.fetchurl {
      url = "http://reign-studios.com/wallpapers/nixos/NixOS_1440p.png";
      hash = "sha256-0u+pX5RlfwupDwVMMTZJ8Nb8UBa1VMxrTTOZnee3Se4=";
    };
    polarity = "dark";
    targets = {
      console.enable = false;
    };
  };
}
