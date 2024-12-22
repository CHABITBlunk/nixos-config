{ config, lib, pkgs, modulesPath, ... }:

let
  hostname = "mingwangxing";
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
    "/" = {
      device = "/dev/disk/by-label/NIXOS_SD";
      fsType = "ext4";
      options = [ "noatime" ];
    };
    "/nas/tsg_gz" = {
      device = "xfs";
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
