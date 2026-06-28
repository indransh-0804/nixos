{inputs, ...}:{
  flake.nixosModules.media = {config, lib, ...}:{
    users = {
      groups.media = {};
      users.sonarr.extraGroups = [ "media" ];
      users.radarr.extraGroups = [ "media" ];
      users.prowlarr.extraGroups = [ "media" ];
      users.qbittorrent.extraGroups = [ "media" ];
    };

    systemd.tmpfiles.rules = [
      "d /data/media/downloads 0775 root media -"
        "d /data/media/tv        0775 root media -"
        "d /data/media/movies    0775 root media -"
        "d /data/media/music     0775 root media -"
    ];
  };
              }
