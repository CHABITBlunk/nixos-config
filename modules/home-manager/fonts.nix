{ config, user, pkgs, lib, ... }:

{ 
  fonts = {
    fontconfig.enable = true;
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      (nerdfonts.override { fonts = [ "Iosevka" "JetBrainsMono" "Ubuntu" ]; })
    ];
  };
}
