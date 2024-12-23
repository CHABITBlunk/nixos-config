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

  services.openssh.enable = true;

  users = {
    groups = {
      jellyfin = {};
      sftp = {};
    };
    mutableUsers = false;
    users."${user}" = {
      isNormalUser = true;
      password = password;
      extraGroups = [ "users" "wheel" ];
    };
    users.sftp = {
      isSystemUser = true;
      password = password;
      group = "sftp";
    };
    users.jellyfin = {
      isNormalUser = true;
      linger = true;
      password = password;
      extraGroups = [ "users" "jellyfin" ];
      packages = with pkgs; [ podman ];
    };
  };

  virtualisation.podman.enable = true;

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "zongtong" = import ./home.nix;
    };
  };

  system.stateVersion = "25.05";
}
