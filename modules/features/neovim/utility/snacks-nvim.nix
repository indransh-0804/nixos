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
                    hidden = true,
                    ignore = true,
                    exclude = {
                    "**/.git/*",
                    },
        	        sources = {
                  files = {
                    hidden = true,
                    ignore = true,
                    exclude = {
                    "**/.git/*",
                    },
                  },
                      explorer = {
                      focus = "input",
                      auto_close = true,
                        layout = {
                          auto_hide = { "input"},
                          layout = {
                          width = 30,
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
                    enabled = true, 
                    -- char = "│",
                    hl = "SnacksIndent",
                  },
                  scope = {
                    enabled = true, -- enable highlighting the current scope
                    -- char = "│",
                  },
                  -- chunk = {
                  --  char = {
                     -- corner_top = "╭",
                     -- corner_bottom = "╰",
                     -- horizontal = " ",
                     -- vertical = "│",
                     -- arrow = " ",
                  --  },
                --  },
                }
      '';
    };
  };
}
