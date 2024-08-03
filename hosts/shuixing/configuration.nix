{ config, lib, inputs, pkgs, ... }:

{
  imports = [ 
    ./hardware-configuration.nix
    ../../modules/nixos/nvidia.nix
    inputs.home-manager.nixosModules.home-manager
  ];

  users.users.xiaolong = {
      isNormalUser = true;j
      initialPassword = "seven sixteen thirty-seven";
      description = "main user";
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

  networking = {
    hostName = "huoxing";
    wireless.enable = true;
  };

  # time zone
  time.timeZone = "America/Denver";

  services = {
    # enable x11
    xserver = {
      enable = true;
      displayManager = {
        startx.enable = true;
        defaultSession = "none+i3";
      };
      windowManager.i3 = {
        enable = true;
        package = pkgs.i3-gaps;
      };
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

  # fonts
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    (nerdfonts.override { fonts = [ "Iosevka" "Ubuntu" ]; })
  ];

  # system-wide packages (build tools, zsh, rust utils, editor)
  environment.systemPackages = with pkgs; [
    neovim
    wget
    curl
    eza
    bat
    zsh
    git
    fzf
    gnumake
    home-manager
  ];

  # copy system config in case you do a boo-boo
  system.copySystemConfiguration = true;

  # WARN: do not delete or change this line whatever you do
  system.stateVersion = "24.05";
}
