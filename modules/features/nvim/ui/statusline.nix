{
  flake.modules.nixos.neovim = { lib, ... }: {
    programs.nvf.settings.vim.statusline.lualine = {
      enable = true;
      setupOpts = lib.generators.mkLuaInline ''
        {
          options = {
            icons_enabled = true,
            theme = {
              normal = {
                a = { bg = '#11111b', fg = '#89b4fa', gui = 'bold' },
                b = { fg = '#cdd6f4', bg = '#11111b' },
                c = { fg = '#cdd6f4', bg = '#11111b' },
              },
              insert = {
                a = { bg = '#11111b', fg = '#a6e3a1', gui = 'bold' },
                b = { fg = '#cdd6f4', bg = '#11111b' },
              },
              visual = {
                a = { bg = '#11111b', fg = '#cba6f7', gui = 'bold' },
                b = { fg = '#cdd6f4', bg = '#11111b' },
              },
              replace = {
                a = { bg = '#11111b', fg = '#f38ba8', gui = 'bold' },
                b = { fg = '#cdd6f4', bg = '#11111b' },
              },
              inactive = {
                a = { fg = '#cdd6f4', bg = '#11111b', gui = 'bold' },
                b = { fg = '#cdd6f4', bg = '#11111b' },
              },
            },
            component_separators = { left = ' ', right = ' ' },
            section_separators = { left = ' ', right = ' ' },
            disabled_filetypes = {
              statusline = {},
            },
            ignore_focus = {},
            always_divide_middle = true,
            always_show_tabline = false,
            globalstatus = true,
          },
          sections = {
            lualine_a = { 'mode' },
            lualine_b = {
              { 'filename', symbols = { modified = ' ', readonly = ' ' } },
            },
            lualine_c = {
              { 'searchcount', maxcount = 999, timeout = 120 },
            },
            lualine_x = {
              { 'branch', icon = ' •' },
              {
                'diff',
                colored = true,
                diff_color = {
                  added = { fg = '#a6e3a1' },
                  modified = { fg = '#fab387' },
                  removed = { fg = '#eba0ac' },
                },
                symbols = { added = ' ', modified = ' ', removed = ' ' },
              },
            },
            lualine_y = {
              {
                'lsp_status',
                icon = ' ',
                symbols = {
                  spinner = { '⠋', '⠙', '⠹', '⠸', '⠼', '⠴', '⠦', '⠧', '⠇', '⠏' },
                  done = '✓',
                  separator = ' ',
                },
                ignore_lsp = { 'null-ls'},
              },
              {
                'diagnostics',
                sources = { 'nvim_lsp', 'nvim_diagnostic', 'nvim_diagnostic', 'vim_lsp', 'coc' },
                symbols = { error = ' ', warn = ' ', info = ' ', hint = '󰌵 ' },
                colored = true,
                update_in_insert = false,
                always_visible = false,
                diagnostics_color = {
                  color_error = { fg = '#eba0ac' },
                  color_warn = { fg = '#fab387' },
                  color_info = { fg = '#a6e3a1' },
                },
              },
            },
            lualine_z = {
              { 'progress' },
              { 'location' },
              { 'filetype', colored = true, icon_only = true },
            },
          },
          inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = { 'filename' },
            lualine_x = { 'location' },
            lualine_y = {},
            lualine_z = {},
          },
        }
      '';
    };
  };
}
