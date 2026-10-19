{inputs , ...}:{
    flake-file.inputs.nixflix = {
      url = "github:kiriwalawren/nixflix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
	flake.modules.nixos.media = {config, ...}: {
	imports = [ inputs.nixflix.nixosModules.default ];
		nixflix = {
			enable = true;
			mediaDir = "/data/media";
			stateDir = "/data/.state";
			theme = {
				enable = true;
				name = "catppuccin-mocha";
			};   
		};
	};
	}
