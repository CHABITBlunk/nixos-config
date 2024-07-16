{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting = true;
    shellAliases = {
      vim = "nvim";
      ls = "exa";
    };
    ohMyZsh = {
      enable = true;
      plugins = [ "git" "command-not-found" ];
      theme = "gentoo";
    };
  };
}
