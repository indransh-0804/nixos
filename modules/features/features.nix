{ inputs, ... }: {
  flake = {
    modules.nixos.features.imports = with inputs.self.modules.nixos; [
      hyprland
      sddm
      media
      catppuccin
      noctalia
    ];
    modules.homeManager.indransh =
      {
        lib,
        ...
      }:
      {
        imports = with inputs.self.modules.homeManager; [
          terminal
	  gtk
        ];
        home = {
          username = lib.mkDefault "indransh";
          homeDirectory = lib.mkDefault "/home/indransh";
          stateVersion = "26.11";
          shell.enableZshIntegration = true;
        };
        programs.home-manager.enable = true;
      };
  };
}
