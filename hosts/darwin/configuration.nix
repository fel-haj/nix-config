{ config, pkgs, system, hostName, ... }:
{
  nix = {
    settings.experimental-features = "nix-command flakes";
    gc = {
      automatic = true;
      interval = [
        {
          Hour = 6;
          Minute = 30;
          Weekday = 7;
        }
      ];
      options = "--delete-older-than 30d";
    };
  };

  nixpkgs.hostPlatform = system;

  networking.hostName = hostName;

  system = {
    stateVersion = 5;

    defaults = {
      dock = {
        autohide = true;
        show-recents = false;
        mru-spaces = false;
        expose-group-apps = true;
      };

      trackpad = {
        Clicking = true;
        TrackpadRightClick = true;
        TrackpadThreeFingerDrag = true;
      };

      CustomUserPreferences = {
        ".GlobalPreferences" = {
          # automatically switch to a new space when switching to the application
          AppleSpacesSwitchOnActivate = true;
        };
        NSGlobalDomain = {
          # Add a context menu item for showing the Web Inspector in web views
          WebKitDeveloperExtras = true;
        };
        "com.apple.finder" = {
          AppleShowAllFiles = true;
          _FXSortFoldersFirst = true;
          # When performing a search, search the current folder by default
          FXDefaultSearchScope = "SCcf";
        };
      };
    };
  };

  # security.pam.enableSudoTouchIdAuth = true;
  security.pam.services.sudo_local = { 
    enable = true;
    touchIdAuth = true;
  };

  fonts = {
    packages = with pkgs; [
      # icon fonts
      material-design-icons
      font-awesome

      # nerd fonts 
      nerd-fonts.symbols-only
      nerd-fonts.jetbrains-mono
    ];
  };
}
