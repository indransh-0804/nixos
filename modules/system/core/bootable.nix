{
  flake.nixosModules.boot = {
    boot = {
      initrd = {
        luks.devices."cryptnixos" = {
          device = "/dev/disk/by-label/NIXOS_LUKS";
          keyFile = "/etc/luks-keyfile";
        };
        secrets = {
          "/etc/luks-keyfile" = "/etc/luks-keyfile";
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
      };
    };
  };
}
