{
  flake.nixosModules.neovim = { lib, ... }: {
    programs.nvf.settings.vim.utility.snacks-nvim = {
      enable = true;
      setupOpts = lib.generators.mkLuaInline ''
        {
          indent = {
            priority = 1,
            enabled = true, -- enable indent guides
            char = "│",
            hl = "SnacksIndent", ---@type string|string[] hl groups for indent guides
          },
          animate = {
            enabled = true,
            style = "up_down",
            easing = "linear",
            duration = {
              step = 99,
              total = 500, -- maximum duration
            },
          },
          scope = {
            enabled = true, -- enable highlighting the current scope
            char = "│",
          },
          chunk = {
            char = {
              corner_top = "╭",
              corner_bottom = "╰",
              horizontal = " ",
              vertical = "│",
              arrow = " ",
            },
          },
          filter = function(buf, win)
            return vim.g.snacks_indent ~= false and vim.b[buf].snacks_indent ~= false and vim.bo[buf].buftype == ""
          end,
        }
      '';
    };
  };
}
