{
  flake.modules.homeManager.terminal = {
    programs.wezterm = {
      enable = true;
      enableZshIntegration = true;
      extraConfig = ''
        local wezterm = require("wezterm")
        local conf = wezterm.config_builder()

        -- Fonts

        conf.font = wezterm.font_with_fallback({
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

        conf.font_rules = {
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

        conf.font_size = 12.5
        conf.line_height = 1.15

        conf.freetype_load_target = "HorizontalLcd"
        conf.freetype_render_target = "HorizontalLcd"

        conf.enable_wayland = true
        conf.dpi = 96
        -- conf.front_end = "WebGpu"

        -- Colors

        local custom = wezterm.color.get_builtin_schemes()["Catppuccin Mocha"]
        custom.background = "#11111b"
        conf.color_schemes = { ["catppuccin-custom"] = custom }
        conf.color_scheme = "catppuccin-custom"

        -- Window

        conf.window_padding = { left = 10, right = 10, top = 5, bottom = 5 }
        conf.window_decorations = "NONE"
        conf.window_background_opacity = 1.0
        conf.text_background_opacity = 1.0
        conf.window_close_confirmation = "NeverPrompt"

        -- Tabs / cursor

        conf.enable_tab_bar = false
        conf.default_cursor_style = "SteadyUnderline"
        conf.cursor_blink_rate = 500

        -- Misc

        conf.max_fps = 60
        conf.scrollback_lines = 4999
        conf.audible_bell = "Disabled"
        conf.visual_bell = {
          fade_in_duration_ms = 175,
          fade_out_duration_ms = 175,
        }
        conf.check_for_updates = false
        conf.warn_about_missing_glyphs = true
        conf.term = "wezterm"

        return conf
      '';
    };
  };
}
