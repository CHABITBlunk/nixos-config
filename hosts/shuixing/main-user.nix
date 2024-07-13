{ lib, config, pkgs, ...}:

let
    cfg = config.main-user;
in {
  options.main-user = {
    enable = lib.mkEnableOption "enable user module";
    userName = lib.mkOption {
      default = "mainuser";
      description = "username";
    };
  };
  config = lib.mkIf cfg.enable {
    users.users.${cfg.userName} = {
      isNormalUser = true;
      initialPassword = "seven sixteen thirty-seven"
        description = "main user";
      shell = pkgs.zsh;
      packages = with pkgs; [
        firefox
        audacity
        rofi
        nwg-look
        lxappearance
        zathura
        cmus
        polybar
        discord
        vlc
      ];
    };
  };
}
