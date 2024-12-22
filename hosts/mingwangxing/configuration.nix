{ config, pkgs, lib, ...}:

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
    };
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "zongtong" = import ./home.nix;
    }
  };

  system.stateVersion = "25.05";
}
