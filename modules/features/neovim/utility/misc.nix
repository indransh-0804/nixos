{
  flake.nixosModules.neovim = { lib, ... }: {
    programs.nvf.settings.vim = {
      utility = {
        smart-splits.enable = true;
        undotree.enable = true;
        grug-far-nvim.enable = true;
        motion.flash-nvim.enable = true;
      };
      comments.comment-nvim.enable = true;
      snacks-nvim = {
        enable = true;
        setupOpts = lib.generators.mkLuaInline ''
          {
            bigfile = { enabled = true },
            dashboard = { enabled = false },
            input = { enabled = true },
            notifier = {
              enabled = true,
              timeout = 3000,
            },
            picker = { enabled = true },
            quickfile = { enabled = true },
            scope = { enabled = true },
            scroll = { enabled = true },
            statuscolumn = { enabled = true },
            words = { enabled = true },
            styles = {
              notification = {
                -- wo = { wrap = true } -- Wrap notifications
              }
            }
          }
        '';
      };
    };
  };
}
