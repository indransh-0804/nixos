{
  flake.nixosModules.neovim = {
    programs.nvf.settings.vim.visuals = {
      highlight-undo.enable = true;
      nvim-cursorline.enable = true;
      nvim-web-devicons.enable = true;
    };
  };
}
