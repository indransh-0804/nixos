{
  flake.modules.nixos.neovim = {
    programs.nvf.settings.vim = {
      languages.yaml = {
        enable = true;
        lsp.enable = true;
        treesitter.enable = true;
      };
    };
  };
}
