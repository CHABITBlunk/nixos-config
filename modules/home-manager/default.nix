{ config, pkgs, ... }:
{ 
  services.dunst = {
    enable = true;
    settings = {
      global = {
        frame_color = "#ae81ff";
        separator_color = "frame";
        font = "Iosevka Nerd Font 10";
      };
    };
    urgency_low = {
      background = "#080808";
      foreground = "#9e9e9e";
    };
    urgency_normal = {
      background = "#080808";
      foreground = "#9e9e9e";
    };
    urgency_critical = {
      background = "#080808";
      foreground = "#9e9e9e";
      frame_color = "#ff5454";
    };
  };
}
