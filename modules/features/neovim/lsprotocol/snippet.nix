{
  flake.nixosModules.neovim = {
    programs.nvf.settings.vim = {
      snippets.luasnip = {
        enable = true;
        providers = [ "friendly-snippets" ];
      };
    };
  };
}
