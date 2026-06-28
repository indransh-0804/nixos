{inputs, ...}:{
  flake.nixosModules.media = {config, ...}:{
    services = {
      
      prowlarr = {
        enable = true;
        openFirewall = true;
        settings = {
          server.port = 9696;
          update.automatically = true;
        };
      };

      sonarr = {
        enable = true;
        group = "media";
        openFirewall = true;
        settings = {
          server.port = 8989;
          update.automatically = true;
        };
      };

      radarr = {
        enable = true;
        group = "media";
        openFirewall = true;
        settings = {
          server.port = 7878;
          update.automatically = true;
        };
      };


      lidarr = {
        enable = true;
        group = "media";
        openFirewall = true;
        settings = {
          server.port = 8686;
          update.automatically = true;
        };
      };

    };
  };
              }
