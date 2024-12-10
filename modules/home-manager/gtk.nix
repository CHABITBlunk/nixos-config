{ config, pkgs, ... }:
{
  gtk  = {
    enable = true;
    theme = {
      name = "sweet-dark";
      package = pkgs.sweet;
    };
    iconTheme = {
      name = "candy-icons";
      package = pkgs.candy-icons;
    };
    cursorTheme = {
      name = "Bibata-Ice";
      package = pkgs.bibata-cursors;
      size = 16;
    };
    font = {
      name = "Ubuntu Nerd Font";
      package = with pkgs; [ (pkgs.nerdfonts.override { fonts = [ "Ubuntu" ]; }) ];
      size = "12";
    };
  }
  home.programs = with pkgs; [
    deluge-gtk
    discord
  ];
}
