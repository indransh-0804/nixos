{self, lib, ... }:
{
  flake.nixosModules.firmware =
  {
    config,
    pkgs,
    ...
  }:{
    hardware.enableAllFirmware = true;
    hardware.enableRedistributableFirmware = true;
    nixpkgs.config.allowUnfree = true;
  };
}
