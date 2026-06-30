{ inputs, ... }: {
  flake.nixosModules.neovim = {
    programs.nvf.settings.vim = {
      theme = {
        enable = true;
        name = "catppuccin";
        style = "mocha";
        transparent = true;
      };

      luaConfigRC.catppuccin = inputs.nvf.lib.nvim.dag.entryAnywhere ''
        require("catppuccin").setup({
        flavour = "mocha", -- latte, frappe, mocha, mocha
        background = { -- :h background
            dark = "mocha",
        },
        transparent_background = true, -- disables setting the background color.
        dim_inactive = {
            enabled = true, -- dims the background color of inactive window
            shade = "dark",
            percentage = 0.15, -- percentage of the shade to apply to the inactive window
        },
        color_overrides = {
            mocha = {
            base = "#11111b",
            },
        },
                default_integrations = true,
                auto_integrations = true,
            })

      '';
    };
  };
}
