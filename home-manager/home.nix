{ config, lib, pkgs, hostName, user, darwin, ... }:
{
  imports = [
    ./modules/git.nix
    ./modules/symlinks.nix
    ./modules/zsh.nix
  ] ++ (lib.optionals (!darwin) [
    # ./modules/wayland.nix
  ]);

  home = {
    stateVersion = "24.11";

    packages = with pkgs; [
      # utils
      fzf
      ripgrep
      tmux

      # dev
      nodejs_23

      # devops
      terraform
    ] ++ (lib.optionals (darwin) [
      powershell
    ]) ++ (lib.optionals (!darwin) [
      clang
      firefox
      # ghostty
      kitty
    ]);

    sessionPath = [
      "${config.home.homeDirectory}/.go/bin"
    ];
  };

  xdg.enable = true;
  # programs.neovim creates below file - conflicts with symlink of nvim config
  xdg.configFile."nvim/init.lua".enable = false;

  programs = {
    home-manager.enable = true;

    neovim = {
      enable = true;
      defaultEditor = true;
      vimAlias = true;
    };

    # A modern replacement for ‘ls’
    eza = {
      enable = true;
      git = true;
      icons = "auto";
      colors = "auto";
      enableZshIntegration = true;
      extraOptions = [
        "-l" # Long listing format
        "--group-directories-first"
        "--git"
      ];
    };

    # terminal file manager
    yazi = {
      enable = true;
      enableZshIntegration = true;
      settings = {
        manager = {
          show_hidden = true;
          sort_dir_first = true;
        };
      };
    };

    direnv = {
      enable = true;
      enableZshIntegration = true;
      config = {
        load_dotenv = true;
      };
      stdlib = "source_up .env";
    };
  
    starship = {
      enable = true;
      enableZshIntegration = true;
    };

    go = {
      enable = true;
      goPath = ".go";
    };
  };
}
