{
  flake.nixosModules.neovim = { lib, ... }: {
    programs.nvf.settings.vim = {
      ui.colorful-menu-nvim.enable = true;
      snippets.luasnip = {
        enable = true;
        providers = [ "friendly-snippets" ];
      };
      autocomplete.blink-cmp = {
        enable = true;
        friendly-snippets.enable = true;
        setupOpts = lib.generators.mkLuaInline ''
          {
              snippets = {
                preset = "luasnip",
              },

              completion = {
                accept = {
                  auto_brackets = {
                    enabled = true,
                  },
                },
                menu = {
                auto_show = true,
                  draw = {
                    columns = { { "kind_icon" }, { "label", gap = 1 } },
                    components = {
                        label = {
                            text = function(ctx)
                                return require("colorful-menu").blink_components_text(ctx)
                            end,
                            highlight = function(ctx)
                                return require("colorful-menu").blink_components_highlight(ctx)
                            end,
                        },
                    },
                    treesitter = { "lsp" },
                  },
                },
                documentation = {
                  auto_show = true,
                  auto_show_delay_ms = 2999,
                },
                ghost_text = {
                  enabled = true,
                  show_with_menu = true,
                },
              },
              fuzzy = { implementation = "prefer_rust" },

              signature = { enabled = true },

              sources = {
                default = { "lsp", "path", "snippets", "buffer" },
              },

              cmdline = {
                enabled = false,
              },

              keymap = {
                preset = "super-tab",
              },
          }
        '';
      };
    };
  };
}
