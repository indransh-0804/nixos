{inputs, ...}:{
  flake.nixosModules.neovim = { lib, ...}:{
    programs.nvf.settings.vim.autopairs.nvim-autopairs.enable = true;
  };
  }
