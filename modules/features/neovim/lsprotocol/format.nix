{inputs, ...}:{
  flake.nixosModules.neovim = {config, ...}: {
    programs.nvf.settings.vim.formatter.conform-nvim = {
      enable = true;
      setupOpts = { 
        format_on_save = {
          timeout_ms = 500;
          lsp_format = "fallback";
        };
        formatters_by_ft = {
          lua = {"stylua"};
          rust = { "rustfmt" };
          nix = { "nixfmt" };
        };
      };
    };
  };
              }
