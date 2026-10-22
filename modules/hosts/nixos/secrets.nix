{ inputs, ... }: {
	flake-file.inputs.sops-nix.url = "github:Mic92/sops-nix";
	flake.modules.nixos.secrets = {
		imports = [ inputs.sops-nix.nixosModules.sops ];
		sops = {
			defaultSopsFile = ../../../secrets/secrets.yaml;
			age = {
				keyFile = "/home/indransh/.config/sops/age/keys.txt";
			};
			secrets = {
				"sonarr/api_key" = {};
				"sonarr/password" = {};
				"radarr/api_key" = {};
				"radarr/password" = {};
				"prowlarr/api_key" = {};
				"prowlarr/password" = {};
				"lidarr/api_key" = {};
				"lidarr/password" = {};
				"jellyfin/api_key" = {};
				"jellyfin/password" = {};
				"seerr/api_key" = {};
				"navidrome/password" = {};
				"qui/session" = {};
			};
		};
	};
		 }
