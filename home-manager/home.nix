{ lib, pkgs, user, userEmail, darwin, ... }:
{
  imports = [
    ./modules/git.nix
    ./modules/symlinks.nix
    ./modules/zsh.nix
  ];

  home = {
    stateVersion = "24.11";

    packages = with pkgs; [
      # utils
      fzf
      ripgrep
      tmux

      # devops
      terraform
    ] ++ (lib.optionals (!darwin) [
      clang
      firefox
      ghostty
      xclip
    ]);
  };

  xdg.enable = true;


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
    };
  
    starship = lib.mkIf darwin {
      enable = true;
      enableZshIntegration = true;
    };

    go = lib.mkIf darwin {
      enable = true;
      goPath = ".go";
    };
  };
}
