{
  flake.nixosModules.neovim = { lib, ... }: {
    programs.nvd.settings.vim.dashboard.dashboard-nvim = {
      enable = true;
      setupOpts = lib.generator.mkLuaInline ''
        		theme = "hyper",
        		config = {
        			week_header = { enable = false },
        			header = {
        				[[                                                                       ]],
        				[[                                                                     ]],
        				[[       ████ ██████           █████      ██                     ]],
        				[[      ███████████             █████                             ]],
        				[[      █████████ ███████████████████ ███   ███████████   ]],
        				[[     █████████  ███    █████████████ █████ ██████████████   ]],
        				[[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
        				[[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
        				[[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
        				[[                                                                       ]],
        				[[                                                                       ]],
        			},
        			shortcut = {
        				{
        					icon = " ",
        					key = "f",
        					desc = "Find File",
        					action = ":lua Snacks.dashboard.pick('files')",
        				},
        				{
        					icon = "󰁯 ",
        					key = "r",
        					desc = "Recent Files",
        					action = "Snacks.picker.recent()",
        				},
        				{
        					icon = " ",
        					key = "F",
        					desc = "Find Projects",
        					action = "Snacks.picker.projects()",
        				},
        				{ icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
        				{ icon = "󰈆 ", key = "q", desc = "Quit", action = ":qa" },
        			},
        			packages = { enable = false },
        			mru = { enable = false },
        			project = { enable = false },
        			footer = { " ", "Welcome Indransh!" },
        		},
        	},
        }
      '';
    };
  };
}
