{ config, lib, pkgs, hostName, ... }:
{
  imports =
    [ 
      ../standard.nix
      ./hardware-configuration.nix
    ];
  
  networking.hostName = hostName;
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Amsterdam";

  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound.
  # hardware.pulseaudio.enable = true;
  # OR
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.libinput.enable = true;

  programs = {
    hyprland = {
      enable = true;
      withUWSM = true;
    };
  };

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };

  hardware = {
    graphics.enable = true;
  };

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
  
  fonts = {
    fontDir.enable = true;

    packages = with pkgs; [
      papirus-icon-theme
      nerd-fonts.fira-code
      nerd-fonts.jetbrains-mono
    ];
  };

  environment = {
    systemPackages = with pkgs; [
      blueberry
      brightnessctl
      dunst
      grim
      hyprpaper
      hyprlock
      networkmanagerapplet
      waybar
      wl-clipboard
      wlogout
      wofi
    ];
  };

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = false;
}
