{self, ...}:{
  flake = {
    nixosModules.features.imports = with self.nixosModules; [
      hyprland
        sddm
    ];
    homeModules.indransh = {config, pkgs, ...}: {
    imports = with self.homeModules; [
    wezterm 
    ];
      home = {
        username = "indransh";
        homeDirectory = "/home/indransh";
        stateVersion = "26.05";
      };
      programs.home-manager.enable = true;
    };
  };
            }

