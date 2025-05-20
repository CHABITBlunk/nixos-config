{ config, pkgs, inputs, lib, ...}:

let
  user = "zongtong";
  password = "seven sixteen thirty-seven";
in {

  imports = [ 
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.home-manager
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  time.timeZone = "America/Denver";

  i18n.defaultLocale = "en_US.UTF-8";

  services = {
    openssh = {
      enable = true;
      extraConfig = ''
        Subsystem sftp internal-sftp
      '';
    };
    jellyfin = {
      enable = true;
      openFirewall = true;
      user = "jellyfin";
    };
  };

  users = {
    groups = {
      sftp = {};
      jellyfin = {};
    };
    mutableUsers = false;
    users."${user}" = {
      isNormalUser = true;
      initialPassword = password;
      group = "wheel";
      extraGroups = [ "users" "jellyfin" ];
    };
    users.sftp = {
      isNormalUser = true;
      initialPassword = password;
      group = "sftp";
      extraGroups = [ "jellyfin" ];
    };
    users.jellyfin = {
      isSystemUser = true;
      initialPassword = password;
      group = "jellyfin";
    };
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "zongtong" = import ./home.nix;
    };
  };

  environment.systemPackages = with pkgs; [
    jellyfin
    jellyfin-web
    jellyfin-ffmpeg
  ];

  system.stateVersion = "25.05";
}
