{inputs, ...}:{
  flake.nixosModules.media = {config, lib, ...}:{

    users = { 
      groups = { 
        media = {};
        sonarr = {};
        radarr = {};
        prowlarr = {};
        lidarr = {};
      };

      users = { 
        sonarr = {
          isSystemUser = true;
          group = "sonarr";
          extraGroups = [ "media" ];
        };

        radarr = {
          isSystemUser = true;
          group = "radarr";
          extraGroups = [ "media" ];
        };

        prowlarr = {
          isSystemUser = true;
          group = "prowlarr";
          extraGroups = [ "media" ];
        };

        lidarr = {
          isSystemUser = true;
          group = "lidarr";
          extraGroups = [ "media" ];
        };
      };
    };

    systemd.tmpfiles.rules = [
      "d /data/media            0775 root media -"
        "d /data/media/downloads  0775 root media -"
        "d /data/media/tv         0775 root media -"
        "d /data/media/movies     0775 root media -"
        "d /data/media/music      0775 root media -"
    ];
  };
              }
