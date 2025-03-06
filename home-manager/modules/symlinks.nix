{ config, pkgs, lib, inputs, darwin, ... }:
let
  conf = "${config.xdg.configHome}";
  dot = "${config.home.homeDirectory}/.dotfiles";
  symlink = config.lib.file.mkOutOfStoreSymlink;
in
{
  home.file = lib.mkMerge [
  {
    "${conf}/nvim" = {
      source = symlink "${dot}/nvim";
    };
      "${conf}/starship" = {
        source = symlink "${dot}/starship";
      };
    "${conf}/tmux" = {
      source = symlink "${dot}/tmux";
    };
  }
    (lib.mkIf darwin {
      "${conf}/aerospace" = {
        source = symlink "${dot}/aerospace";
      };
    })
  ];
}
