{ config, lib, inputs, pkgs, ... }:

{
  imports = [ 
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.home-manager
  ];

  users = {
    extraGroups.vboxusers.members = [ "xiaolong" ];
    users.xiaolong = {
      isNormalUser = true;
      initialPassword = "seven sixteen thirty-seven";
      extraGroups = [ "wheel" ];
      shell = pkgs.zsh;
    };
  };

  # set locale
  i18n.defaultLocale = "en_US.UTF-8";

  # add flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  networking.hostName = "shuixing";

  # time zone
  time.timeZone = "America/Denver";

  services = {
    # enable x11
    xserver = {
      enable = true;
      displayManager = {
        startx.enable = true;
      };
      windowManager.bspwm.enable = true;
      xkb.layout = "us";
    };

    displayManager.defaultSession = "none+bspwm";

    # enable sound
    pipewire = {
      enable = true;
      pulse.enable = true;
    };

    # openssh
    openssh = {
      enable = true;
      settings = {
        PermitRootLogin = "no";
        PasswordAuthentication = false;
      };
    };

    # dbus
    dbus.enable = true;
  };

  programs.dconf.enable = true;

  fonts = {
    fontconfig.enable = true;
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-emoji
      nerd-fonts.iosevka
      nerd-fonts.jetbrains-mono
      nerd-fonts.ubuntu
    ];
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "xiaolong" = import ./home.nix;
    };
  };

  virtualisation.virtualbox.host.enable = true;

  programs.zsh.enable = true;

  # WARN: do not delete or change this line whatever you do
  system.stateVersion = "24.05";
}
