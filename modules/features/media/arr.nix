{
  flake.modules.nixos.media = {
    services = {

      jellyfin = {
        enable = true;
        group = "media";
      };

      prowlarr = {
        enable = true;
        settings = {
          server.port = 9696;
          update.automatically = false;
          auth.required = "DisabledForLocalAddresses";
        };
      };

      sonarr = {
        enable = true;
        group = "media";
        settings = {
          server.port = 8989;
          update.automatically = false;
          auth.required = "DisabledForLocalAddresses";
        };
      };

      radarr = {
        enable = true;
        group = "media";
        settings = {
          server.port = 7878;
          update.automatically = false;
          auth.required = "DisabledForLocalAddresses";
        };
      };

      lidarr = {
        enable = true;
        group = "media";
        settings = {
          server.port = 8686;
          update.automatically = false;
          auth.required = "DisabledForLocalAddresses";
        };
      };
    };
  };
}
