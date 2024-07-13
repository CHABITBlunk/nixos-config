{ config, user, pkgs, lib, ... }:

{
  services.xserver = {
    enable = true;
    displayManager = {
      startx.enable = true;
    };
  };
  programs = {
    dconf.enable = true;
  };
}
