{ config, lib, pkgs, ... }:
{
  imports =
    [ 
      ../../../modules/nixos
      ./hardware-configuration.nix
    ];

  time.timeZone = "Europe/Amsterdam";

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };


  environment = {
    systemPackages = with pkgs; [
      vim
    ];
  };

  system.stateVersion = "24.11";
}
