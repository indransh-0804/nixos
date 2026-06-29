{
  flake.nixosModules.neovim = {
    programs.nvf.settings.vim.theme = {
      enable = true;
      name = "catppuccin";
      style = "mocha";
      transparent = true;
      extraConfig = {
        flavour = "mocha";
        background.dark = "mocha";
        dim_inactive = {
          enabled = true;
          shade = "dark";
          percentage = 0.15;
        };
        color_overrides.mocha = {
          base = "#11111B";
        };
      };
    };
  };
}
