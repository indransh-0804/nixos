{
  flake.modules.nixos.neovim = { lib, ...}:{
    programs.nvf.settings.vim = {
      languages.toml = {
        enable = true;
        extraDiagnostics = {
          enable = true;
          types = [ "tombi" ];
        };
        format = {
          enable = true;
          type = [ "tombi" ];
        };
        lsp = {
          enable = true;
          servers = [ "tombi" ];
        };
        treesitter.enable = true;
      };
    };
  };
}
