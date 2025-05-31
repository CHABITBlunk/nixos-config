{ config, pkgs, ... }:

{
  home = {
    username = "guanzhang";
    homeDirectory = "/home/guanzhang";
    stateVersion = "24.05";
    sessionVariables = { EDITOR = "vim"; };
    packages = with pkgs; [
      bash-completion
      curl
      git
      man
      tmux
      vim
      wget
      xdg-user-dirs
      xdg-utils
    ];
  };
  programs.home-manager.enable = true;
}
