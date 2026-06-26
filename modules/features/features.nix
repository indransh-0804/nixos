{self, ...}:{
  flake = {
    nixosModules.features.imports = with self.nixosModules; [
      hyprland
        sddm
    ];
    homeModules.indransh = {config, pkgs, ...}: {
      home = {
        username = "indransh";
        homeDirectory = "/home/indransh";
        stateVersion = "26.05";
        packages = [ pkgs.wezterm ];
      };
      programs.home-manager.enable = true;
    };
  };
            }

