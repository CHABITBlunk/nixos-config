{ config, lib, pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];

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

  # allow unfree for graphics libs
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "nvidia-x11"
    "nvidia-settings"
    "nvidia-persistenced"
  ];

  # hostname
  networking.hostName = "huoxing";

  # wpa_supplicant
  networking.wireless.enable = true;

  # time zone
  time.timeZone = "America/Denver";

  # enable x11
  services.xserver = {
    videoDrivers = ["nvidia"];
    enable = true;
    displayManager.gdm.enable = false;
    displayManager.lightdm.enable = false;
    displayManager.startx.enable = true;
    displayManager.sx.enable = false;
    displayManager.xpra.enable = false;
    windowManager.i3.enable = true;
  };

  # nvidia settings
  hardware.opengl.enable = true;
  hardware.nvidia = {
    modesetting.enable = true;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  # x11 keymap
  services.xserver.xkb.layout = "us";

  # enable sound
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  # user account
  users.users.xiaolong = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    initialPassword = "seven sixteen thirty-seven";
    packages = with pkgs; [
      firefox
      audacity
      kitty
      rofi
      nwg-look
      lxappearance
      zathura
      cmus
      polybar
      discord
    ];
  };

  # TODO: put this into user nixpkgs config, but it can stay here for now
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    shellAliases = {
      vim = "nvim";
    };
    ohMyZsh = {
      enable = true;
      plugins = [ "git" "command-not-found" "zsh-users/zsh-autosuggestion" "zsh-users/zsh-syntax-highlighting" ];
      theme = "gentoo";
    };
  };

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
    bottom
  ];

  # openssh
  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = "no";
      PasswordAuthentication = false;
    };
  };

  # copy system config in case you do a boo-boo
  system.copySystemConfiguration = true;

  # WARN: do not delete or change this line whatever you do
  system.stateVersion = "24.05";
}
