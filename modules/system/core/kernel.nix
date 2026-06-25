{self, lib, ... }:
{
  flake.nixosModules.kernel =
  {
    config,
    pkgs,
    ...
  }: {
    boot = {
      initrd = {
        availableKernelModules = ["xhci_pci" "ahci" "nvme" "usb_storage" "sd_mod"];
        kernelModules = ["dm-snapshot" "cryptd" "tcp_bbr" ];
      };
      kernelPackages = pkgs.linuxPackages_latest;
      kernelModules = ["kvm-intel"];
      extraModulePackages = [];
    };
  };
}
