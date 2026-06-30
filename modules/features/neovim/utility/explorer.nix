{
  flake.nixosModules.neovim = {
    programs.nvf.settings.vim.utility.snacks-nvim = { lib, ... }: {
      enable = true;
      setupOpts = lib.generators.mkLuaInline ''
        {
          explorer = {
            replace_netrw = true, -- Replace netrw with the snacks explorer
            trash = true, -- Use the system trash when deleting files
          },
          picker = {
            sources = {
              explorer = {
                auto_close = true, -- close the picker when a file is opened
                layout = {
                  layout = {
                    width = 30, -- fixed width of 30 columns on the left
                  },
                },
                win = {
                  input = {
                    enabled = false, -- no search input box at the top
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
        }
      '';
    };
  };
}
