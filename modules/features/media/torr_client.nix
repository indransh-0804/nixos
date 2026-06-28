{inputs, ...}:{
  flake.nixosModules.media = {config, lib, ...}:{
    nixflix.torrentClients.qbittorrent = {
      enable = true;
      user = "indransh";
      group = "media";
      downloadsDir = "$${config.nixflix.downloadsDir}"
      serverConfig.Preferences.WebUI = {
        Password_PBKDF2 = "@ByteArray(ARQ77eY1N UZaQsuDHbIMCA==:0WMRkYTUWVT9wVvdDtHAjU9 b3b7uB8NR1Gur2hmQCvСDpm39Q+PsJRJPaCU51dE iz+dTzh8qbPsL8WkFljQYFQ==)"
      };  
      password._secret = config.sops.secrets."qbittorrent/password".path;
    };
  };
              }
