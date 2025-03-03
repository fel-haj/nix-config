{ nixpkgs, inputs,  ... }:
{
  system,
  hostName,
  user,
  darwin ? false,
}:

let
  hostConfig = ../hosts/${if darwin then "darwin" else "nixos/${hostName}"}/configuration.nix;
  userOSConfig = ../user/${if darwin then "darwin" else "nixos"}.nix;
  userHMConfig = ../home-manager/home.nix;
  homeDir = if darwin then "/Users/${user}" else "/home/${user}";

  systemFunc = if darwin then inputs.nix-darwin.lib.darwinSystem else nixpkgs.lib.nixosSystem;
  home-manager = if darwin then inputs.home-manager.darwinModules else inputs.home-manager.nixosModules;
in systemFunc rec {
  inherit system;

  modules = [
    { nixpkgs.config.allowUnfree = true; }

    hostConfig
    userOSConfig
    home-manager.home-manager {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.users.${user} = import userHMConfig;
      home-manager.extraSpecialArgs = {
        inherit hostName user darwin;
      };
      users.users.${user}.home = homeDir;
    }

    # We expose some extra arguments so that our modules can parameterise
    # better based on these values.
    {
      config._module.args = {
        system = system;
        hostName = hostName;
        user = user;
        inputs = inputs;
      };
    }
  ] ++ (nixpkgs.lib.optionals (!darwin) [
      inputs.stylix.nixosModules.stylix
  ]);
}
