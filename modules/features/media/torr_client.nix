{inputs, ...}:{
  flake.nixosModules.media = {
    nixflix.torrentClients.qbittorrent = {
      enable = true;
      group = "media";
      user = "indranshs";
      password._secret = config.sops.secrets."qbittorrent/password".path;
      categories = {
radarr = lib.optionalString (config.nixflix.radarr.enable or false) "/data/media/downloads/radarr";
sonarr = lib.optionalString (config.nixflix.sonarr.enable or false) "/data/media/downloads/sonarr";
lidarr = lib.optionalString (config.nixflix.lidarr.enable or false) "/data/media/downloads/lidarr";
prowlarr = lib.optionalString (config.nixflix.prowlarr.enable or false) "/data/media/downloads/prowlarr";
};


