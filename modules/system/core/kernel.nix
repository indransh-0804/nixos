{self, lib, ... }:
{
  flake.modules.nixos.kernel =
  {
    config,
    pkgs,
    ...
  }: {
    boot = {
      initrd = {
        availableKernelModules = ["xhci_pci" "ahci" "nvme" "usb_storage" "sd_mod"];
        kernelModules = ["dm-snapshot" "cryptd" "tcp_bbr" "ntsync" ];
      };
      kernelPackages = pkgs.linuxPackages_latest;
      kernelModules = ["kvm-amd"];
      kernelParams = [ "amd_pstate=active" ];
      extraModulePackages = [];
    };
    hardware.enableAllFirmware = true;
    hardware.enableRedistributableFirmware = true;
    nixpkgs.config.allowUnfree = true;
  };
}
