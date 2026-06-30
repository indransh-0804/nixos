{
  flake.nixosModules.neovim = {
    programs.nvf.settings.vim.utility.snacks-nvim = {
      enable = true;
      setupOpts = {
        indent = {
          enabled = true;
        };
        animate = {
          enabled = true;
          style = "out";
          easing = "linear";
          duration = {
            step = 20;
            total = 500;
          };
        };
        scope = {
          enabled = true;
          priority = 200;
          char = "│";
          underline = false;
          only_current = false;
          hl = "SnacksIndentScope";
        };
        chunk = {
          enabled = true;
          char = {
            corner_top = "╭";
            corner_bottom = "╰";
            horizontal = " ";
            vertical = "│";
            arrow = " ";
          };
        };
      };
    };
  };
}
