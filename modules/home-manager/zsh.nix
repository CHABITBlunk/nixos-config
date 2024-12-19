{ config, lib, pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    shellAliases = {
      vim = "nvim";
      ls = "exa";
    };
    syntaxHighlighting = {
      enable = true;
    };
    autosuggestion.enable = true;
    antidote = {
      enable = true;
      plugins = [
        "ohmyzsh/ohmyzsh path:git"
        "ohmyzsh/ohmyzsh path:command-not-found"
      ]; 
    };
    initExtra = ''
      set -o vi
    '';
  };
}
