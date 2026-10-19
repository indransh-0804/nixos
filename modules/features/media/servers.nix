{
	flake.modules.nixos.media = {config, ...}: {
		nixflix = {
 jellyfin = {
enable = true;
      apiKey._secret = config.sops.secrets."jellyfin/api_key".path;
users.admin = {
mutable = false;
          policy.isAdministrator = true;
          password._secret = config.sops.secrets."jellyfin/password".path;
};
system.metadataPath = "${config.nixflix.stateDir}/jellyfin/metadata";
};
    
seerr = {
enable = true;
      apiKey._secret = config.sops.secrets."seerr/api_key".path;
};
    
navidrome = {
enable = true;
users = {
        
"Indransh" = { # name displayed in the UI
          
userName = "indranshs"; # username used to login
isAdmin = true;
          password._secret = config.sops.secrets."navidrome/password".path;
};
};
settings = {
MusicFolder = "/data/media/music";
};
};
		};
systemd.tmpfiles.settings."20-jellyfin-metadata"."${config.nixflix.stateDir}/jellyfin/metadata".d = {
    user  = config.nixflix.jellyfin.user;
    group = config.nixflix.jellyfin.group;
    mode  = "0755";
  };
	};
	}
