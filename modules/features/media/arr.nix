{inputs, ...}:{
  flake.nixosModules.media = {config, ...}:{
    services = {

      jellyfin = {
        enable = true;
        group = "media";
        openFirewall = true;
      }; 

      prowlarr = {
        enable = true;
        openFirewall = true;
        settings = {
          server.port = 9696;
          update.automatically = false;
        };
      };

      sonarr = {
        enable = true;
        group = "sonarr";
        openFirewall = true;
        settings = {
          server.port = 8989;
          update.automatically = false;
        };
      };

      radarr = {
        enable = true;
        group = "radarr";
        openFirewall = true;
        settings = {
          server.port = 7878;
          update.automatically = false;
        };
      };


      lidarr = {
        enable = true;
        group = "lidarr";
        openFirewall = true;
        settings = {
          server.port = 8686;
          update.automatically = false;
        };
      };

flaresolverr = {
  enable = true;
  port = 8191;
  openFirewall = true;
};

    };
  };
              }
