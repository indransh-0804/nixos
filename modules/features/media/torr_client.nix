{inputs, ...}:{
  flake.nixosModules.media = {config, lib, ...}:{
    services.qbittorrent = {
      enable = true;
      group = "media";
      webuiPort = 8080;
      openFirewall = true;
        serverConfig = { 
          LegalNotice.Accepted = true;
          Preferences = {
            WebUI = {
              Password_PBKDF2="@ByteArray(ARQ77eY1NUZaQsuDHbIMCA==:0WMRkYTUWVT9wVvdDtHAjU9b3b7uB8NR1Gur2hmQCvCDpm39Q+PsJRJPaCU51dEiz+dTzh8qbPsL8WkFljQYFQ==)";
            };
            General.Locale = "en";
          };
        };
    };
  };
              }
