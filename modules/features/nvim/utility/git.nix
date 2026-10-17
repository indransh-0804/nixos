{
  flake.modules.nixos.neovim = { lib, ... }: {
    programs.nvf.settings.vim.git = {
      enable = true;
      gitsigns.codeActions.enable = true;
    };
  };
}
