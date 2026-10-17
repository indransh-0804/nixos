{
  flake.modules.nixos.media = {

    users = {
      groups.media = { };
      users.indransh.extraGroups = [ "media" ];
      users.jellyfin.extraGroups = [
        "video"
        "render"
      ];
    };

    systemd.tmpfiles.rules = [
      "d /data/media            0775 root media -"
      "Z /data/media            0775 root media -"
      "d /data/media/downloads  0775 root media -"
      "Z /data/media/downloads  0775 root media -"
      "d /data/media/shows      0775 root media -"
      "Z /data/media/shows      0775 root media -"
      "d /data/media/movies     0775 root media -"
      "Z /data/media/movies     0775 root media -"
      "d /data/media/music      0775 root media -"
      "Z /data/media/music      0775 root media -"
    ];
  };
}
