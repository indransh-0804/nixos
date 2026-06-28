{inputs, ...}:{
  flake.nixosModules.media = {config, ...}:{
    nixflix = {
      jellyfin = {
        enable = true;
        apiKey._secret = config.sops.secrets."jellyfin/api_key".path;
        users = {
          indranshs = {
            mutable = false;
            policy.isAdministrator = true;
            password._secret = config.sops.secrets."jellyfin/indranshs_password".path;
          };
        };
      };
      prowlarr = {
        enable = true;
      user = "indransh";
      group = "media";
        config = {
          apiKey._secret = config.sops.secrets."prowlarr/api_key".path;
          hostConfig.password._secret = config.sops.secrets."prowlarr/password".path;
        };
      };

      sonarr = {
        enable = true;
      user = "indransh";
      group = "media";
        config = {
          apiKey._secret = config.sops.secrets."sonarr/api_key".path;
          hostConfig.password._secret = config.sops.secrets."sonarr/password".path;
        };
      };

      radarr = {
        enable = true;
      user = "indransh";
      group = "media";
        config = {
          apiKey._secret = config.sops.secrets."radarr/api_key".path;
          hostConfig.password._secret = config.sops.secrets."radarr/password".path;
        };
      };


      lidarr = {
        enable = true;
      user = "indransh";
      group = "media";
        config = { 
          apiKey._secret = config.sops.secrets."lidarr/api_key".path;
          hostConfig.password._secret = config.sops.secrets."lidarr/password".path;
        };
      };

      recyclarr = {
        enable = true;
      };

    };
  };
              }
