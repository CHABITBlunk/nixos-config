{ config, pkgs, lib, ...}:

let
  user = "zongtong";
  password = "seven sixteen thirty-seven";
in {

  imports = [ 
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.home-manager
  ];

  services = {
    jellyfin.enable = true;
    openssh.enable = true;
  };

  users = {
    mutableUsers = false;
    users."${user}" = {
      isNormalUser = true;
      password = password;
      extraGroups = [ "wheel" ];
    };
    users.tsg_gz = {
      isNormalUser = false;
      password = password;
      extraGroups = [ "sftp" ];
    }
  };

  system.stateVersion = "25.05";
}
