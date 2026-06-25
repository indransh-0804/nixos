{ self, inputs, ... }: {

  flake.nixosModules.filesystem = { config, lib, pkgs, modulesPath, ... }:
{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  fileSystems."/" =
    { device = "/dev/mapper/nixos-core";
      fsType = "btrfs";
      options = [ "subvol=root" ];
    };

  fileSystems."/home" =
    { device = "/dev/mapper/nixos-core";
      fsType = "btrfs";
      options = [ "subvol=home" ];
    };

  fileSystems."/persist" =
    { device = "/dev/mapper/nixos-core";
      fsType = "btrfs";
      options = [ "subvol=persist" ];
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/C8DE-4BFB";
      fsType = "vfat";
      options = [ "fmask=0077" "dmask=0077" ];
    };

  swapDevices =
    [ { device = "/dev/mapper/nixos-swap"; }
    ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault true;
  hardware.enableRedistributableFirmware = lib. mkDefault true;
};
}
