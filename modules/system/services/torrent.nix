{inputs, ...}:{
flake.nixosModules.torrent = { config, pkgs, ... }:
{
  users = {
  groups.media = {};
  users.indransh.extraGroups = [ "media" ];
  };

  systemd.tmpfiles.rules = [
    "d /data/media 2775 root media - -"
    "d /data/media/tv 2775 root media - -"
    "d /data/media/movies 2775 root media - -"
    "d /data/media/downloads 2775 root media - -"
  ];

  services.sonarr = {
    enable = true;
    openFirewall = true;
    group = "media"; # Forces Sonarr to run under the media group
  };

  services.radarr = {
    enable = true;
    openFirewall = true;
    group = "media"; 
  };

  services.qbittorrent = {
    enable = true;
    openFirewall = true;
    group = "media"; 
  };

  services.prowlarr = {
    enable = true;
    openFirewall = true;
  };
}
}
