{ config, pkgs, lib, ... }:
{
  gtk  = {
    enable = true;
    theme = {
      name = "Sweet-Dark";
      package = pkgs.sweet;
    };
    iconTheme = {
      name = "candy-icons";
      package = pkgs.candy-icons;
    };
    cursorTheme = {
      name = "Bibata-Modern-Ice";
      package = pkgs.bibata-cursors;
      size = 16;
    };
    font = {
      name = "Ubuntu Nerd Font";
      package = pkgs.nerd-fonts.ubuntu;
      size = 12;
    };
  };
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "discord"
  ];
  home.packages = with pkgs; [
    deluge-gtk
    discord
    firefox
    lxappearance
    pavucontrol
    signal-desktop
    vscodium
  ];
}
