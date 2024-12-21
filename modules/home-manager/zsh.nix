{ config, lib, pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    shellAliases = {
      vim = "nvim";
      ls = "exa";
    };
    antidote = {
      enable = true;
      plugins = [
        "mattmc3/ez-compinit"
        "zsh-users/zsh-completions kind:fpath path:src"

        "getantidote/use-omz"
        "ohmyzsh/ohmyzsh path:lib"
        "ohmyzsh/ohmyzsh path:plugins/command-not-found"
        "ohmyzsh/ohmyzsh path:plugins/colored-man-pages"
        "ohmyzsh/ohmyzsh path:plugins/git"
        "ohmyzsh/ohmyzsh path:plugins/magic-enter"

        "zsh-users/zsh-autosuggestions"
        "zsh-users/zsh-syntax-highlighting"
        "zdharma-continuum/fast-syntax-highlighting kind:defer"
        "zsh-users/zsh-history-substring-search"
      ]; 
    };
    initExtra = ''
      set -o vi
    '';
  };
}
