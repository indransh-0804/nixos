{ inputs, ... }: {
  flake-file.inputs.catppuccin.url = "github:catppuccin/nix";
  flake = {
    nixosModules.catppuccin = {
      imports = [ inputs.catppuccin.nixosModules.catppuccin ];
      catppuccin = {
        accent = "blue";
        enable = true;
        flavor = "mocha";
        plymouth.enable = false;
        sddm.enable = false;
      };
    };
    homeModules.catppuccin = {
      imports = [ inputs.catppuccin.homeModules.catppuccin ];
      catppuccin = {
        accent = "blue";
        enable = true;
        flavor = "mocha";
      };
    };
  };
}
