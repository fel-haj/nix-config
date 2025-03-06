{ pkgs, inputs, ... }: {
  imports = [ inputs.stylix.homeManagerModules.stylix ];

  home.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    noto-fonts
    noto-fonts-lgc-plus
    noto-fonts-emoji
    font-awesome
  ];

  stylix = {
    enable = true;
    polarity = "dark";

    targets = {
      ghostty.enable = false;
      hyprlock.enable = false;
      waybar.enable = false;
      wofi.enable = false;
    };

    cursor = {
      name = "macOS";
      size = 24;
      package = pkgs.apple-cursor;
    };

    fonts = {
      emoji = {
        name = "Noto Color Emoji";
        package = pkgs.noto-fonts-color-emoji;
      };
      monospace = {
        name = "JetBrains Mono";
        package = pkgs.jetbrains-mono;
      };
      sansSerif = {
        name = "Noto Sans";
        package = pkgs.noto-fonts;
      };
      serif = {
        name = "Noto Serif";
        package = pkgs.noto-fonts;
      };

      sizes = {
        applications = 12;
      };
    };

    iconTheme = {
      enable = true;
      package = pkgs.whitesur-icon-theme;
      dark = "WhiteSur-dark";
      light = "WhiteSur-light";
    };

    image = pkgs.fetchurl {
      url = "http://reign-studios.com/wallpapers/nixos/NixOS_1440p.png";
      hash = "sha256-0u+pX5RlfwupDwVMMTZJ8Nb8UBa1VMxrTTOZnee3Se4=";
    };
  };
}
