{ inputs, ... }: {
  flake-file.inputs.catppuccin.url = "github:catppuccin/nix";
  flake.modules = {
    nixos.catppuccin = {
      imports = [ inputs.catppuccin.nixosModules.catppuccin ];
      home-manager.sharedModules = [ inputs.self.modules.homeManager.catpuccin ];
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
