{ pkgs, user, ... }:
{
  programs.zsh.enable = true;

  users.users.${user} = {
    isNormalUser = true;
    home = "/home/${user}";
    extraGroups = [ "wheel" ];
    shell = pkgs.zsh;
  };
}
