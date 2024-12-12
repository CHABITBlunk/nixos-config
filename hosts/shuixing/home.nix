{ config, pkgs, ... }:

{
  home = {
    username = "xiaolong";
    homeDirectory = "/home/xiaolong";
    stateVersion = "24.05";
    sessionVariable = { EDITOR = "nvim"; };
  };
  programs.home-manager.enable = true;
}
