{self, ...}:{
  flake = {
    nixosModules.features.imports = with self.nixosModules; [
      hyprland
      sddm
      media
      neovim
    ];
    homeModules.indransh = {config, lib, pkgs, ...}: {
    imports = with self.homeModules; [
    wezterm 
    zsh_shell
    cli_tools
    ];
      home = {
        username = lib.mkDefault "indransh";
        homeDirectory = lib.mkDefault "/home/indransh";
        stateVersion = "26.05";
        shell.enableZshIntegration = true;
      };
      programs.home-manager.enable = true;
    };
  };
            }

