{
  flake.nixosModules.neovim = {
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
