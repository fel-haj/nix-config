{
  # programs.ghostty creates files - conflicts with symlink
  xdg.configFile."ghostty/config".enable = false;
  # xdg.configFile."ghostty/themes/stylix".enable = false;

  programs.ghostty = {
    enable = true;
    enableZshIntegration = true;

    settings = {
      theme = "light:catppuccin-latte,dark:catppuccin-mocha";

      font-size = 16;
      cursor-style = "block";
      cursor-style-blink = false;

      window-inherit-working-directory = true;
      window-decoration = true;
      background-opacity = 0.85;
      background-blur-radius = 50;

      mouse-hide-while-typing = true;
      macos-option-as-alt = true;
    };
  };
}
