{
  programs.waybar = {
    enable = true;
    style = ./style.css;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 30;
        modules-left = ["hyprland/workspaces"];
        modules-center = ["hyprland/window"];
        modules-right = ["hyprland/language" "custom/weather" "pulseaudio" "battery" "tray" "clock"];
        "hyprland/workspaces" = {
          disable-scroll = true;
          show-special = true;
          special-visible-only = true;
          all-outputs = false;
          format = "{icon}";
          format-icons = {
            "1" = "";
            "2" = "";
            "3" = "󱔗";
            "4" = "";
          };

          persistent-workspaces = {
            "*" = 4;
          };
        };

        "hyprland/language" = {
          format-en = "AU";
          format-de = "DE";
          tooltip = false;
        };

        # "custom/weather" = {
        #   format = " {} ";
        #   exec = "curl -s 'wttr.in/Tashkent?format=%c%t'";
        #   interval = 300;
        #   class = "weather";
        # };

        "pulseaudio" = {
          # format = "{icon} {volume}%";
          format = "{icon}";
          # format-bluetooth = "{icon} {volume}% ";
          format-bluetooth = "{icon} ";
          format-muted = "";
          format-icons = {
            "headphones" = "";
            "handsfree" = "";
            "headset" = "";
            "default" = ["" ""];
          };
          on-click = "pavucontrol";
        };

        "battery" = {
          states = {
            warning = 30;
            critical = 10;
          };
          format = "{icon}";
          format-alt = "{icon} {capacity}%";
          format-charging = "󰂄 {capacity}%";
          format-icons = ["󰁻" "󰁽" "󰁿" "󰂁" "󰁹"];
        };

        "tray" = {
          icon-size = 24;
          spacing = 12;
        };

        "clock" = {
          format = "{:%a %d %b %H:%M}";
          # format = "{:%d.%m.%Y - %H:%M}";
          # format-alt = "{:%A, %B %d at %R}";
          tooltip = false;
        };
      };
    };
  };
}
