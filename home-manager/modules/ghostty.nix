{ darwin, ... }:
{
  programs.ghostty = {
    enable = true;
    enableZshIntegration = true;

    settings = {
      font-size = 14;
      cursor-style = "block";
      cursor-style-blink = false;

      window-inherit-working-directory = true;
      window-decoration = true;
      background-opacity = 0.85;
      background-blur-radius = 50;

      mouse-hide-while-typing = true;
    } // (if darwin 
    then {
      macos-option-as-alt = true;
      theme = "light:catppuccin-latte,dark:catppuccin-mocha";
    }
    else {
      theme = "catppuccin-mocha";
    });
  };
}
