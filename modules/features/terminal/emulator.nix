{inputs, ...}: {
  flake.homeModules.wezterm = { config, pkgs, lib, ... }: {
    programs.wezterm = {
      enable = true;
      enableZshIntegration = true;
      extraConfig = ''
        local wezterm = require("wezterm")
        local config = wezterm.config_builder()

config.font = wezterm.font(
  { -- Normal text
  family='Fira Code',
  harfbuzz_features={ 
  'calt', 'liga', 'dlig',
  'cv06', 'cv09', 'cv14',
  'cv29', 'cv30', 'cv31',
  'cv25', 'cv26', 'cv27',
  'cv28', 'cv26', 'cv32',
  'ss04', 'ss07', },
})

config.font_rules = {
  { -- Italic
    intensity = 'Normal',
    italic = true,
    font = wezterm.font({
      family='Maple Mono NF', -- courier-like
      style = 'Italic',
    })
  },

  { -- Bold
    intensity = 'Bold',
    italic = false,
    font = wezterm.font( {
      family='Fira Code',
      weight='Bold',
      })
  },

  { -- Bold Italic
    intensity = 'Bold',
    italic = true,
    font = wezterm.font( {
      family='Maple Mono NF',
      style='Italic',
      weight='Bold',
      }
    )
  },
}
        config.font_size = 11.0
        config.line_height = 1.2
        config.color_scheme = "Catppuccin Mocha"
        config.window_padding = {
          left = 8,
          right = 8,
          top = 6,
          bottom = 6,
        }
        config.window_decorations = "NONE"
        config.window_background_opacity = 1.0
        config.text_background_opacity = 1.0
        config.window_close_confirmation = "NeverPrompt"
        config.enable_tab_bar = false
        config.default_cursor_style = "SteadyBlock"
        config.cursor_blink_ease_in = "Constant"
        config.cursor_blink_ease_out = "Constant"
        config.cursor_blink_rate = 0
        config.max_fps = 60
        config.front_end = "OpenGL"
        config.scrollback_lines = 3999
        config.audible_bell = "Disabled"
        config.visual_bell = {
          fade_in_duration_ms = 0,
          fade_out_duration_ms = 0,
          target = "CursorColor",
        }
        config.check_for_updates = false
        config.warn_about_missing_glyphs = true
        config.term = "wezterm"
        return config
        '';
    };
  };
               }
