{ config, lib, pkgs, modulesPath, ... }:

let
  hostname = "tushuguan";
in {
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  boot = {
    kernelPackages = pkgs.linuxKernel.packages.linux_rpi4;
    initrd.availableKernelModules = [ "xhci_pci" "usbhid" "usb_storage" ];
    loader = {
      grub.enable = false;
      generic-extlinux-compatible.enable = true;
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

  hardware.enableRedistributableFirmware = true;
}
