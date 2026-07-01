{
  flake.nixosModules.neovim = { lib, ... }: {
    programs.nvf.settings.vim.ui.noice = {
      enable = true;
      setupOpts = lib.generators.mkLuaInline ''
        	{
        		cmdline = {
        			view = "cmdline",
        		},
            notify = {
              enabled = false,
            },
        		routes = {
        			{
        				filter = {
        					event = "msg_show",
        					any = {
        						{ find = "%d+L, %d+B" },
        						{ find = "; after #%d+" },
        						{ find = "; before #%d+" },
        					},
        				},
        				view = "mini",
        			},
        		},
        		presets = {
        			bottom_search = true,
        			command_palette = true,
        			inc_rename = true,
        			lsp_doc_border = false,
        		},
        	},
        }
      '';
    };
  };
}
