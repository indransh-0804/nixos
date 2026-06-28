{inputs, ...}:{
  flake.nixosModules.neovim = { lib, ...}:{
    programs.nvf.settings.vim = {
      lsp.presets.nixd.enable = true;
      languages.nix = { 
        enable = true;
        extraDiagnostics.enable = true;
        format = { 
        enable = true;
        type = [ "nixfmt" ];
        };
        treesitter.enable = true;
        lsp = { 
          enable = true;
          servers = [ "nixd" ];
        };
      };
    };
    };
    }
