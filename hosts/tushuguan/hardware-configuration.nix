{ config, lib, pkgs, modulesPath, ... }:

let
  hostname = "tushuguan";
in {
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  boot = {
    initrd = {
      availableKernelModules = [ "xhci_pci" "usbhid" "nvme" ];
      kernelModules = [ ];
    };
    kernelModules = [ ];
    loader = {
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
  };

  fileSystems = {
    "/boot/efi" = {
      device = "/dev/disk/by-label/NIXBOOT";
      fsType = "vfat";
    };
    "/" = {
      device = "/dev/disk/by-label/NIXROOT";
      fsType = "btrfs";
      options = [ "noatime" ];
    };
  };

  networking = {
    hostName = hostname;
    firewall.enable = true;
    wireless.enable = false;
  };

  networking.interfaces.enp4s0f4u1c2.useDHCP = lib.mkDefault true;
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
