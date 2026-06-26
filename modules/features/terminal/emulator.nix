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
        config.keys = {
          -- splits
          { key = "e", mods = "CTRL|SHIFT", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
          { key = "o", mods = "CTRL|SHIFT", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },

          -- pane navigation
          { key = "h", mods = "CTRL|SHIFT", action = act.ActivatePaneDirection("Left") },
          { key = "l", mods = "CTRL|SHIFT", action = act.ActivatePaneDirection("Right") },
          { key = "k", mods = "CTRL|SHIFT", action = act.ActivatePaneDirection("Up") },
          { key = "j", mods = "CTRL|SHIFT", action = act.ActivatePaneDirection("Down") },

          -- close pane
          { key = "w", mods = "CTRL|SHIFT", action = act.CloseCurrentPane({ confirm = false }) },

          -- font size
          { key = "=", mods = "CTRL", action = act.IncreaseFontSize },
          { key = "-", mods = "CTRL", action = act.DecreaseFontSize },
          { key = "0", mods = "CTRL", action = act.ResetFontSize },

          -- copy/paste
          { key = "c", mods = "CTRL|SHIFT", action = act.CopyTo("Clipboard") },
          { key = "v", mods = "CTRL|SHIFT", action = act.PasteFrom("Clipboard") },

          -- scroll
          { key = "u", mods = "CTRL|SHIFT", action = act.ScrollByPage(-0.5) },
          { key = "d", mods = "CTRL|SHIFT", action = act.ScrollByPage(0.5) },

          -- search
          { key = "f", mods = "CTRL|SHIFT", action = act.Search("CurrentSelectionOrEmptyString") },
          
          -- enter copy mode (vim-style selection)
          { key = "Space", mods = "CTRL|SHIFT", action = act.ActivateCopyMode },
        }
        
        return config
        '';
    };
  };
               }
