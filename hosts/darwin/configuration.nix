{
  imports =
    [ 
      ../../modules
    ];
  
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
}
