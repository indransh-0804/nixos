{
  flake.nixosModules.neovim = { lib, ... }: {
    programs.nvf.settings.vim.utility.snacks-nvim = {
      enable = true;
      setupOpts = lib.generators.mkLuaInline ''
        {
          bigfile = { enabled = true },
          dashboard = { enabled = false },
          input = { enabled = true },
          notifier = {
            enabled = false,
          },
          quickfile = { enabled = true },
          scroll = { enabled = true },
          statuscolumn = { enabled = true },
          words = { enabled = true },
          explorer = {
            replace_netrw = true, 
            trash = true, 
          },
          picker = {
          enabled = true,
	  sources = {
              explorer = {
                layout = {
                auto_close = true,
                  auto_hide = { "input"},
                },
                win = {
                  input = {
                    enabled = false,
                  },
                },
                formatters = {
                  file = { filename_only = true },
                  severity = { pos = "right" },
                },
                matcher = { sort_empty = false, fuzzy = true },
              },
            },
          },
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
        }
      '';
    };
  };
}
