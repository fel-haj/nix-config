{ config, lib, pkgs, hostName, ... }:
{
  imports =
    [ 
      ../../../modules
      ./hardware-configuration.nix
    ];
  
  time.timeZone = "Europe/Amsterdam";

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  services = {
    openssh = {
      enable = true;
      settings = {
        PasswordAuthentication = true;
        PermitRootLogin = "yes";
      };
    };
    pipewire = {
      enable = true;
      pulse.enable = true;
    };
  };

  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;


  environment = {
    systemPackages = with pkgs; [
      brightnessctl
      dunst
      hyprpaper
      hyprlock
      networkmanagerapplet
      waybar
      wl-clipboard
      wlogout
      wofi
    ];
  };

  system.stateVersion = "24.11";
}
