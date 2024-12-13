{ config, pkgs, ... }:

{
  home = {
    username = "xiaolong";
    homeDirectory = "/home/xiaolong";
    stateVersion = "24.05";
    sessionVariables = { EDITOR = "nvim"; };
  };
  programs.home-manager.enable = true;
  imports = (import ../../modules/home-manager);
}
