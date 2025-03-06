{ lib, pkgs, darwin, ... }:
{
  fonts = lib.mkMerge [
    {
      packages = with pkgs; [
        # icon fonts
        material-design-icons
        font-awesome

        # nerd fonts 
        nerd-fonts.symbols-only
        nerd-fonts.jetbrains-mono
      ];
    }
    (lib.mkIf (!darwin) {
      fontDir.enable = true;
    })
  ];
}
