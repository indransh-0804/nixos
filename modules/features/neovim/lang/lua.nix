{inputs, ...}:{
  flake.nixosModules.neovim = {config, ...}:{
    programs.nvf.settings.vim = {
      languages.lua = {
        enable = true;
        extraDiagnostics = {
          enable = true;
          types = [ "selene" ];
        };
        format.enable = true;
        lsp.enable = true;
        treesitter.enable = true;
      };
    };
  };
              }

