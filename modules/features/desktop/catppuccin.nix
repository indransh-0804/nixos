{ inputs, ... }: {
  flake-file.inputs.catppuccin.url = "github:catppuccin/nix/release-26.05";
  flake.modules = {
    nixos.catppuccin = {
      imports = [ inputs.catppuccin.nixosModules.catppuccin ];
      home-manager.sharedModules = [ inputs.self.modules.homeManager.catppuccin ];
      catppuccin = {
        accent = "blue";
        autoEnable = true;
        enable = true;
        flavor = "mocha";
        sddm.enable = false;
        plymouth.enable = false;
      };
    };
    homeManager.catppuccin = {
      imports = [ inputs.catppuccin.homeModules.catppuccin ];
      catppuccin = {
        accent = "blue";
        autoEnable = true;
        enable = true;
        flavor = "mocha";
      };
    };
  };
}
