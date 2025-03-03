{
  description = "NixOS & Nix-darwin flake configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-darwin = {
      url = "github:LnL7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland";

    stylix.url = "github:danth/stylix";
  };

  outputs = { nixpkgs, ... }@inputs:
  let
    mkSystem = import ./lib/mksystem.nix {
      inherit nixpkgs inputs;
    };
    user      = "felix";
  in {
    nixosConfigurations.nixos-desktop = mkSystem {
      system    = "x86_64-linux";
      hostName  = "desktop";
      user      = user;
    };

    darwinConfigurations.macbook-x86 = mkSystem {
      system    = "x86_64-darwin";
      hostName  = "Felix-MBP-2020";
      user      = user;
      darwin    = true;
    };

    darwinConfigurations.macbook-aarch64 = mkSystem {
      system    = "aarch64-darwin";
      hostName  = "Felix-MBA-M2";
      user      = user;
      darwin    = true;
    };
  };
}
