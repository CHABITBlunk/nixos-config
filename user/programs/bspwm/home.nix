{ config, lib, pkgs, ... }:

{
  xsession = {
    enable = true;
    windowManager.bspwm = {
      enable = true;
      alwaysResetDesktops = true;
      startupPrograms = [
        "sxhkd"
        "dunst"
        "eww -c \"$HOME/.config/eww/bar\" open bar"
        "picom -b"
        "feh --bg-scale ${./bg/forbidden-city.jpeg}"
      ];
      monitors = {
        # left
        DP-0 = ["一" "二" "三" "四" "五"];
        # right
        HDMI-0 = ["六" "七" "八" "九" "十"];
      };
      settings = {
        pointer_modifier = "mod4";
        border_width = 3;
        window_gap = 5;
        split_ratio = 0.5;
        focus_follows_pointer = true;
        borderless_monocle = false;
        gapless_monocle = false;
        normal_border_color = "#323437";
        focused_border_color = "#ae81ff";
        urgent_border_color = "#ff5454";
        active_border_color = "#484f58";
      };
    };
  };
}
