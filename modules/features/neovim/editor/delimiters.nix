{
  flake.nixosModules.neovim = {
    programs.nvf.settings.vim.visuals.rainbow-delimiters = {
      enable = true;
    };
  };
}
