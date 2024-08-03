# home.nix
{ config, pkgs, ... }:

{
  home = {
    username = "xiaolong";
    homeDirectory = "/home/xiaolong";
    stateVersion = "24.05";
  }
}
