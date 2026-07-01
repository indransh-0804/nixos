{
  flake.nixosModules.neovim = {
    programs.nvf.settings.vim = {
      visuals = {
        highlight-undo.enable = true;
        nvim-cursorline.enable = true;
        nvim-web-devicons.enable = false;
        rainbow-delimiters.enable = true;
      };
      ui.borders = {
        enable = true;
        globalStyle = "rounded";
      };
      mini = {
        animate.enable = true;
        icons.enable = true;
      };
    };
  };
}
