{ config, lib, pkgs, hostName, user, ... }:
{
  imports =
    [ 
      ../nixos-default.nix
      ./hardware-configuration.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = hostName;
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Amsterdam";

  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true;
  # };

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  # hardware.pulseaudio.enable = true;
  # OR
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.libinput.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # services.xserver = {
  #   enable = true;
  #
  #   windowManager.i3 = {
  #     enable = true;
  #   };
  # };
  #
  # services.displayManager = {
  #   defaultSession = "none+i3";
  # };

  programs = {
    hyprland = {
      enable = true;
      withUWSM = true;
      # xwayland.enable = true;
    };
    # uwsm = {
    #   waylandCompositors = {
    #     hyprland = {
    #       prettyName = "Hyprland";
    #       comment = "Hyprland compositor managed by UWSM";
    #       binPath = "/run/current-system/sw/bin/Hyprland";
    #     };
    #   };
    # };
  };

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };

  # xdg.portal = {
  #   enable = true;
  #   extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  # };
  #
  # hardware = {
  #   graphics.enable = true;
  # };

  # services.greetd = {
  #   enable = true;
  #   settings = {
  #     initialSession = {
  #       command = "${pkgs.hyprland}/bin/Hyprland";
  #       user = user;
  #     };
  #     defaultSession = {
  #       command = "${pkgs.greetd.tuigreet}/bin/tuigreet --greeting 'Welcome to NixOS.'";
  #       user = user;
  #     };
  #   };
  # };
  
  fonts = {
    fontDir.enable = true;

    packages = with pkgs; [
      font-awesome
      fira-code
      nerd-fonts.jetbrains-mono
    ];
  };

  environment = {
    systemPackages = with pkgs; [
      brightnessctl
      dunst
      hyprpaper
      hyprpolkitagent
      libnotify
      rofi-wayland
      waybar
    ];
  };

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = false;
}

