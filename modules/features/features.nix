{self, ...}:{
  flake = {
    nixosModules.features.imports = with self.nixosModules; [
      hyprland
        sddm
    ];
    homeModules.indransh = {config, pkgs, ...}: {
    imports = with self.homeModules; [
    wezterm 
    zsh_shell
    cli_tools
    ];
      home = {
        username = "indransh";
        homeDirectory = "/home/indransh";
        stateVersion = "26.05";
        shell.enableZshIntegration = true;
      };
      programs.home-manager.enable = true;
    };
  };
            }

