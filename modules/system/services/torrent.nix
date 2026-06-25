{inputs, ...}:{
flake.nixosModules.torrent = { config, pkgs, ... }:

{
  # 1. Create a dedicated 'media' group
  users.groups.media = {};

  # 2. Add your personal user to the media group so you can manage the files
  # REPLACE "myuser" WITH YOUR ACTUAL NIXOS USERNAME
  users.users.myuser.extraGroups = [ "media" ];

  # 3. Create the directories automatically with the correct permissions
  systemd.tmpfiles.rules = [
    "d /data/media 2775 root media - -"
    "d /data/media/tv 2775 root media - -"
    "d /data/media/movies 2775 root media - -"
    "d /data/media/downloads 2775 root media - -"
  ];

  # 4. Enable the Services
  services.sonarr = {
    enable = true;
    openFirewall = true;
  };

  services.radarr = {
    enable = true;
    openFirewall = true;
  };

  services.prowlarr = {
    enable = true;
    openFirewall = true;
  };

  # Note: The native qbittorrent service is available in NixOS 24.05 and newer.
  services.qbittorrent = {
    enable = true;
    openFirewall = true;
  };

  # 5. Add the automatically created service users to the 'media' group
  # This ensures they can all read and write to /data/media without conflicts
  users.users.sonarr.extraGroups = [ "media" ];
  users.users.radarr.extraGroups = [ "media" ];
  users.users.prowlarr.extraGroups = [ "media" ];
  users.users.qbittorrent.extraGroups = [ "media" ];
};
}
