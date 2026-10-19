{
  flake.modules.nixos.media = {config, ...}:{
  nixflix.torrentClients.qbittorrent = {
    enable = true;
    serverConfig = {
          LegalNotice.Accepted = true;
          Preferences = {
            WebUI = {
              LocalHostAuth = false;
              Password_PBKDF2 = "@ByteArray(ARQ77eY1NUZaQsuDHbIMCA==:0WMRkYTUWVT9wVvdDtHAjU9b3b7uB8NR1Gur2hmQCvCDpm39Q+PsJRJPaCU51dEiz+dTzh8qbPsL8WkFljQYFQ==)";
            };
            General.Locale = "en";
          };
        };
      };
      services.qui = {
        enable = true;
	user = "qbittorrent";
	group = "media";
	secretFile = config.sops.secrets."qui/session".path;
    };
};
}
