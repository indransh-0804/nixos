{self, lib, ... }:
{
  flake.nixosModules.boot =
  {
    config,
    pkgs,
    ...
  }: {
    boot = {
      initrd = {
        luks.devices."cryptnixos" = {
          device = "/dev/disk/by-label/NIXOS_LUKS";
        };
      };
      loader = {
        grub = {
          enable = true;
          device = "nodev";
          useOSProber = true;
          copyKernels = true;
          efiSupport = true;
          fsIdentifier = "label";
        };
        efi = {
          canTouchEfiVariables = true;
          efiSysMountPoint = "/boot";
        };
      };
      tmp.cleanOnBoot = true;
      plymouth = {
        enable = true;
        theme = "breeze";
      };
    };
  };
}
