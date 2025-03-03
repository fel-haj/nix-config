{config, lib, pkgs, darwin, ...}:
let
  flake-rebuild = "rebuild switch --flake ${config.home.homeDirectory}/.nix-config";
in {
  programs.zsh = {
    enable = true;
    enableCompletion = true;

    history = {
      ignoreAllDups = true;
    };

    # get rev and hash -> e.g. nix-prefetch-github zsh-users zsh-autosuggestions --rev v0.7.1
    plugins = with pkgs; [
      {
        name = "zsh-autosuggestions";
        src = fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-autosuggestions";
          rev = "e52ee8ca55bcc56a17c828767a3f98f22a68d4e"; # v0.7.1
          hash = "sha256-vpTyYq9ZgfgdDsWzjxVAE7FZH4MALMNZIFyEOBLm5Qo=";
        };
      }
      {
        name = "zsh-syntax-highlighting";
        src = fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-syntax-highlighting";
          rev = "5eb677bb0fa9a3e60f0eff031dc13926e093df92"; # 0.8.0
          hash = "sha256-KRsQEDRsJdF7LGOMTZuqfbW6xdV5S38wlgdcCM98Y/Q=";
        };
      }
    ];

    sessionVariables = {
      CLICOLOR=1;
      LS_COLORS="di=36:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43";
      STARSHIP_CONFIG="${config.home.homeDirectory}/.config/starship/starship.toml";
    };

    autosuggestion = {
      enable = true;
      strategy = [
        "history"
        "completion"
      ];
    };

    syntaxHighlighting = {
      enable = true;
      highlighters = [
        "pattern"
      ];
      patterns = {
        "$*" = "fg=magenta";
        "$* " = "fg=magenta";
      };
      styles = {
        alias = "fg=blue";
        builtin = "fg=blue";
        command = "fg=blue";
        function = "fg=blue";
        commandseparator = "fg=magenta";
        path = "fg=cyan,underline";
        path_pathseparator = "fg=white,underline";
        single-hyphen-option = "fg=#9fa6a8,dim";
        double-hyphen-option = "fg=#9fa6a8";
      };
    };

    initExtra = ''
      bindkey -e
      bindkey -s '^v' 'yazi^J'
      bindkey '\ej' autosuggest-execute
      bindkey '^n' history-beginning-search-forward
      bindkey '^p' history-beginning-search-backward
      setopt ignore_eof
      # Remove / to not be part of words
      WORDCHARS='~!#$%^&*(){}[]<>?.+;-'
      ${lib.optionalString (!darwin) ''
        if uwsm check may-start; then
          exec uwsm start hyprland
        fi
      ''}
    '';
  };

  home.shellAliases = {
    ls = "eza";
    lt = "eza --tree --level=2";
    rebuildx86 = if darwin then "darwin-${flake-rebuild}#macbook-x86" else "nixos-${flake-rebuild}#nixos-desktop";
    rebuild = "darwin-${flake-rebuild}#macbook-aarch64";
  };
}
