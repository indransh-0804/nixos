{inputs, ...}:{
	flake-file.inputs.nh.url = "github:nix-community/nh";
	flake.modules.nixos.nix = {
		nix.optimise = {
			automatic = true;
			dates = [ "weekly" ];
		};
		system.autoUpgrade = {
			enable = true;
			flake = "/home/indransh/.nixos";
		};
		programs = { 
			nix-ld.enable = true;
			nh = {
				enable = true;
				flake = "/home/indransh/.nixos";
				clean = {
					enable = true;
					extraArgs = "--keep-since 21d --keep 3";
				};
			};
		};
		environment.variables = {
			NH_FLAKE = "/home/indransh/.nixos"; 
			NH_OS_FLAKE = "/home/indransh/.nixos";
		};
	};
	      }

