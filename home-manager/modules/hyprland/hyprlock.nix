{
  programs.hyprlock = {
    enable = true;

    settings = {

      general = {
        disable_loading_bar = true;
        grace = 10;
        hide_cursor = true;
        no_fade_in = false;
      };

      label = [
        {
          text = "$TIME";
          font_size = 90;
          font_family = "JetBrains Mono";
          color = "rgba(235, 219, 178, 1.0)";
          position = "0, 600";
          halign = "center";
          walign = "center";
          shadow_passes = 1;
        }
        {
          text = "cmd[update:43200000] date +'%A, %d %B %Y'";
          font_size = 15;
          font_family = "JetBrains Mono";
          color = "rgba(235, 219, 178, 1.0)";
          position = "0, 750";
          halign = "center";
          walign = "center";
        }
      ];

      background = [
        {
          path = "screenshot";
          blur_passes = 2;
          blur_size = 4;
        }
      ];

      input-field = [
        {
          size = "200, 35";
          position = "0, -350";
          halign = "center";
          walign = "center";
          monitor = "";
          dots_center = true;
          font_color = "rgb(235, 219, 178)";
          inner_color = "rgb(40, 40, 40)";
          outer_color = "rgb(60, 56, 54)";
          outline_thickness = 5;
          placeholder_text = "Enter Password";
          shadow_passes = 1;
        }
      ];
    };
  };
}
