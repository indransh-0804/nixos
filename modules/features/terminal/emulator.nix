{inputs, ...}: {
  flake.homeModules.wezterm = { config, pkgs, lib, ... }: {
    programs.wezterm = {
      enable = true;
      enableZshIntegration = true;
      extraConfig = ''
        local wezterm = require("wezterm")
        local config = wezterm.config_builder()
        config.font = wezterm.font("JetBrains Mono", { weight = "Regular" })
        config.font_size = 12.0
        config.line_height = 1.2
        config.color_scheme = "Tokyo Night Storm"
        config.window_padding = {
          left = 4,
          right = 4,
          top = 2,
          bottom = 2,
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
        config.max_fps = 120
        config.front_end = "WebGpu"
        config.webgpu_power_preference = "HighPerformance"
        config.scrollback_lines = 5000
        config.audible_bell = "Disabled"
        config.visual_bell = {
          fade_in_duration_ms = 0,
          fade_out_duration_ms = 0,
          target = "CursorColor",
        }
        config.check_for_updates = false
        config.warn_about_missing_glyphs = false
        config.term = "wezterm"
        local act = wezterm.action
        return config
      '';
    };
  };
}
