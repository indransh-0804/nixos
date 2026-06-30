{
  flake.homeModules.wezterm = {
    programs.wezterm = {
      enable = true;
      enableZshIntegration = true;
      extraConfig = ''
        local wezterm = require("wezterm")
        local config = wezterm.config_builder()
        -- Fonts
        config.font = wezterm.font_with_fallback({
          {
            family = 'Fira Code',
            harfbuzz_features = {
              'calt', 'liga', 'dlig',
              'cv10', 'cv09', 'cv14',
              'cv02', 'cv30', 'cv01',
              'cv25', 'cv26', 'cv27',
              'cv28', 'cv32',
              'ss04', 'ss07',
            },
          },
          'Symbols Nerd Font',
        })
        config.font_rules = {
          { -- Italic
            intensity = 'Normal',
            italic = true,
            font = wezterm.font({ family = 'Maple Mono', style = 'Italic' }),
          },
          { -- Bold
            intensity = 'Bold',
            italic = false,
            font = wezterm.font({ family = 'Fira Code', weight = 'Bold' }),
          },
          { -- Bold Italic
            intensity = 'Bold',
            italic = true,
            font = wezterm.font({ family = 'Maple Mono', style = 'Italic', weight = 'Bold' }),
          },
        }
        config.font_size = 11.5
        config.line_height = 1.15
        -- Colors
        local custom = wezterm.color.get_builtin_schemes()["Catppuccin Mocha"]
        custom.background = "#000000"
        config.color_schemes = { ["catppuccin-custom"] = custom }
        config.color_scheme = "catppuccin-custom"
        -- Window
        config.window_padding = { left = 8, right = 8, top = 6, bottom = 6 }
        config.window_decorations = "NONE"
        config.window_background_opacity = 1.0
        config.text_background_opacity = 1.0
        config.window_close_confirmation = "NeverPrompt"
        -- Tabs / cursor
        config.enable_tab_bar = false
        config.default_cursor_style = "SteadyUnderline"
        config.cursor_blink_rate = 500
        -- Misc
        config.max_fps = 60
        config.front_end = "OpenGL"
        config.scrollback_lines = 3999
        config.audible_bell = "Disabled"
        config.visual_bell = {
          fade_in_duration_ms = 175,
          fade_out_duration_ms = 175,
          target = 'CursorColor',
        }
        config.check_for_updates = false
        config.warn_about_missing_glyphs = true
        config.term = "wezterm"
        return config
      '';
    };
  };
}
