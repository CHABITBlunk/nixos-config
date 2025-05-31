{ config, pkgs, inputs, lib, ...}:

let
  user = "guanzhang";
  password = "seven sixteen thirty-seven";
in {

  imports = [ 
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.home-manager
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  time.timeZone = "America/Denver";

  i18n.defaultLocale = "en_US.UTF-8";

  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot/efi";
    };
    grub = {
      efiSupport = true;
      device = "nodev";
    };
  };

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
      extraGroups = [ "users" ];
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
      "guanzhang" = import ./home.nix;
    };
  };

  environment.systemPackages = with pkgs; [
    jellyfin
    jellyfin-web
    jellyfin-ffmpeg
    unison
  ];

  system.stateVersion = "25.05";
}
