{
  flake.modules.nixos.neovim = { lib, ... }: {
    programs.nvf.settings.vim = {
      lsp = {
        enable = true;
        formatOnSave = true;
        inlayHints.enable = true;
        lspSignature.enable = false;
        presets.harper.enable = false;
        trouble.enable = true;
      };
    };
  };
}
