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
    openssh.enable = true;
    jellyfin = {
      enable = true;
      openFirewall = true;
      user = "zongtong";
    };
  };

  users = {
    groups = {
      sftp = {};
    };
    mutableUsers = false;
    users."${user}" = {
      isNormalUser = true;
      initialPassword = password;
      extraGroups = [ "users" "wheel" ];
    };
    users.sftp = {
      isSystemUser = true;
      initialPassword = password;
      group = "sftp";
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
