{
  flake.nixosModules.neovim = { lib, ... }: {
    programs.nvf.settings.vim.statusline.lualine = {
      enable = true;
      icons.enable = true;
      alwaysDivideMiddle = true;
      componentSeparator = {
        left = " ";
        right = " ";
      };
      activeSection = {
        a = [
          ''{ "mode", icons_enabled = true, } ''
        ];
        b = [
          ''{ "filetype", colored = true, icon_only = true, } ''
          ''{ "filename", symbols = {modified = ' ', readonly = ' '}, } ''
        ];
        c = [
          "{ 'searchcount', maxcount = 999, timeout = 120, } "
        ];
        x = [
          ''{ "branch", icon = ' •', } ''
          ''{ "diff", colored = true, diff_color = { added = 'DiffAdd', modified = 'DiffChange', removed = 'DiffDelete', }, symbols = {added = '+', modified = '~', removed = '-'}, } ''
        ];
        y = [
          ''
            {
              'lsp_status',
              icon = '',
              symbols = {
                spinner = { '⠋', '⠙', '⠹', '⠸', '⠼', '⠴', '⠦', '⠧', '⠇', '⠏' },
                done = '✓',
                separator = ' ',
              },
              ignore_lsp = {},
            }
          ''
          ''{ "diagnostics", sources = {'nvim_lsp', 'nvim_diagnostic', 'nvim_diagnostic', 'vim_lsp', 'coc'}, symbols = {error = '󰅙 ', warn = ' ', info = ' ', hint = '󰌵 '}, colored = true, update_in_insert = false, always_visible = false, diagnostics_color = { color_error = { fg = 'red' }, color_warn = { fg = 'yellow' }, color_info = { fg = 'cyan' }, }, } ''
        ];
        z = [
          ''{ "progress" } ''
          ''{"location"} ''
        ];
      };
      setupOpts = lib.generators.mkLuaInline ''
                        {
                        options = {
                        theme = {
                local colors = {
                  blue   = '#89b4fa',
                  green  = '#a6e3a1',
                  purple = '#cba6f7',
                  cyan   = '#89dceb',
                  red1   = '#f38ba8',
                  red2   = '#eba0ac',
                  yellow = '#f9e2af',
                  fg     = '#cdd6f4',
                  bg     = '#11111b',
                  gray1  = '#7f849c',
                  gray2  = '#313244',
                  gray3  = '#45475a',
                }
        return {
          normal = {
            a = { bg = colors.bg, fg = colors.blue, gui = 'bold' },
            b = { bg = colors.fg, fg = colors.gray3 },
            c = { bg = colors.fg, fg = colors.gray2 },
          },
          insert = {
            a = { bg = colors.bg, fg = colors.green, gui = 'bold' },
            b = { bg = colors.fg, fg = colors.gray3 },
          },
          visual = {
            a = { bg = colors.bg, fg = colors.purple, gui = 'bold' },
            b = { bg = colors.fg, fg = colors.gray3 },
          },
          replace = {
            a = { bg = colors.bg, fg = colors.red1, gui = 'bold' },
            b = { bg = colors.fg, fg = colors.gray3 },
          },
          inactive = {
            a = { bg = colors.fg, fg = colors.bg, gui = 'bold' },
            b = { bg = colors.fg, fg = colors.bg },
            c = { bg = colors.fg, fg = colors.gray2 },
          },
        }
                        },
                        },
                        }

      '';
    };
  };
}
