{
  flake.nixosModules.neovim = { lib, ... }: {
    programs.nvf.settings.vim = {
      visuals = {
        highlight-undo.enable = true;
        nvim-cursorline.enable = true;
        nvim-web-devicons.enable = lib.mkDefault false;
        rainbow-delimiters.enable = true;
      };
      ui.borders = {
        enable = true;
        globalStyle = "rounded";
      };
      mini = {
        icons.enable = true;
      };
    };
  };
}
