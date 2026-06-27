{inputs, ...}:{
  flake-file.inputs.nixflix = {
    url = "github:kiriwalawren/nixflix";
    inputs.nixpkgs.follows = "nixpkgs";
  };
  flake.nixosModules.media = {
    imports = [ inputs.nixflix.nixosModules.default ];

    nixflix = {
      enable = true;
      mediaDir = "/data/media";
      stateDir = "/data/.state";
      downloadDir = "/data/media/downloads";
      mediaUsers = [ "media" ];

      postgres.enable = true;
      nginx = { 
        enable = true;
        addHostsEntries = true;
      };
    };
  };
              }
