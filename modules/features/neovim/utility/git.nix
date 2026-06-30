{
  flake.nixosModules.neovim = {
    programs.nvf.settings.vim.git = {
      enable = true;
      gitsigns.codeActions.enable = true;
    };
  };
}
