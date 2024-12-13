{ config, lib, inputs, pkgs, ... }:

{
  imports = [ 
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.home-manager
  ];

  users.users.xiaolong = {
      isNormalUser = true;
      initialPassword = "seven sixteen thirty-seven";
      description = "main user";
      extraGroups = [ "wheel" ];
      shell = pkgs.zsh;
  };

  # bootloader
  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot/efi";
    };
    grub = {
      efiSupport = true;
      device = "nodev";
      enable = true;
      useOSProber = true;
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
      displayManager.startx.enable = true;
      windowManager.bspwm.enable = true;
      xkb.layout = "us";
    };

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
    dbus = {
      enable = true;
      packages = [ pkgs.dconf ];
    };
  };

  fonts = {
    fontconfig.enable = true;
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      (nerdfonts.override { fonts = [ "Iosevka" "JetBrainsMono" "Ubuntu" ]; })
    ];
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "xiaolong" = import ./home.nix;
    };
  };

  programs.zsh.enable = true;

  # WARN: do not delete or change this line whatever you do
  system.stateVersion = "24.05";
}
