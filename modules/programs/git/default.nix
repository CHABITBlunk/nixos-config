{
  programs.git = {
    enable = true;
    userEmail = "cblunk097@gmail.com";
    userName = "cblunk";
    extraConfig = {
      pull.rebase = true;
    };
  };
}
