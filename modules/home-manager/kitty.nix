{ pkgs, ... }:
{
  programs.kitty = {
    enable = true;
    font = {
      name = "Iosevka Nerd Font";
      package = (pkgs.nerdfonts.override { fonts = [ "Iosevka" ] });
      size = 10;
    };
    extraConfig = ''
    cursor_blink_interval 0
    enable_audio_bell no
    linux_display_server x11
    display_ligatures cursor
    cursor_trail 1
    cursor_trail_decay 0.1 0.25
    background            #080808
    foreground            #bdbdbd
    cursor                #9e9e9e
    color0                #323437
    color1                #ff5454
    color2                #8cc85f
    color3                #e3c78a
    color4                #80a0ff
    color5                #cf87e8
    color6                #79dac8
    color7                #c6c6c6
    color8                #949494
    color9                #ff5189
    color10               #36c692
    color11               #c6c684
    color12               #74b2ff
    color13               #ae81ff
    color14               #85dc85
    color15               #e4e4e4
    selection_background  #b2ceee
    selection_foreground  #080808
    '';
  };
}
