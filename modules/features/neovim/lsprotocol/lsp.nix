{
  flake.nixosModules.neovim = {
    programs.nvf.settings.vim = {
      lsp = {
        enable = true;
        formatOnSave = true;
        inlayHints.enable = true;
        lspSignature.enable = false;
        presets.harper.enable = true;
      };
    };
  };
}
