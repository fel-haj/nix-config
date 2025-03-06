{ nixpkgs, inputs, user,  ... }:
{
  system,
  hostName,
  darwin ? false,
}:

let
  hostConfig = ../hosts/${if darwin then "darwin" else "nixos/${hostName}"}/configuration.nix;
  
  homeDir = if darwin then "/Users/${user}" else "/home/${user}";

  systemFunc = if darwin then inputs.nix-darwin.lib.darwinSystem else nixpkgs.lib.nixosSystem;

  home-manager = if darwin then inputs.home-manager.darwinModules else inputs.home-manager.nixosModules;
in systemFunc rec {
  inherit system;

  modules = [
    hostConfig
    home-manager.home-manager {
      home-manager.users.${user} = import ../home-manager/home.nix;
      home-manager.extraSpecialArgs = {
        inherit user inputs hostName darwin;
      };
      users.users.${user}.home = homeDir;
    }

    # expose some extra arguments
    {
      config._module.args = {
        user = user;
        inputs = inputs;
        system = system;
        hostName = hostName;
      };
    }
  ];
}
