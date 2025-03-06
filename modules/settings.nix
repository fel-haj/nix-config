{ darwin, ...}
{
  nix = {
    settings.experimental-features = "nix-command flakes";
    gc = {
      automatic = true;
      options = "--delete-older-than 14d";
    } // (if darwin
      then {
        interval = [
          {
            Hour = 6;
            Minute = 30;
            Weekday = 7;
          }
        ];
      }
      else {
        dates = "weekly";
      });
    };
  };
}
