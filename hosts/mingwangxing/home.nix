{ config, pkgs, ... }:

{
  home = {
    username = "zongtong";
    homeDirectory = "/home/zongtong";
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
