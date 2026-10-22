{ lib, pkgs, inputs, ... }: 
let 
  oled = {
    mocha = { 
      base = "000000";
      mantle = "010101";
      crust = "020202";
    };
  };
  in {  
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
sources = inputs.catppuccin.x86_64-linux.packages.overrideScope (
    final: prev: {
      whiskers = pkgs.symlinkJoin {
        name = "whiskers-wrapped";

        paths = [ prev.whiskers ];
        nativeBuildInputs = [ pkgs.makeBinaryWrapper ];

        postBuild = ''
          wrapProgram $out/bin/whiskers \
            --add-flag ${lib.escapeShellArg "--color-overrides=${builtins.toJSON oled}"}
        '';

        meta.mainProgram = "whiskers";
      };
    }
  );
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
