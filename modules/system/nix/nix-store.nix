
{self, inputs, ...}:{
  flake.nixosModules.nix = {
    nix = {
      optimise = {
        automatic = true;
        dates = [ "weekly" ];
      };
    };
    system.autoUpgrade = {
      enable = true;
      flake = "/home/indransh/.nixos";
      dates = "21:00";
      allowReboot = false;
    };
  };
                    }
