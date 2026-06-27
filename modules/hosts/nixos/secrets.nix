{inputs, ...}:{
flake-file.inputs.sops-nix = {
url = "github:Mic92/sops-nix";
inputs.nixpkgs.follows = "nixpkgs";
};
flake.nixosModules.sops-nix = {config, ...}: {
imports = [ inputs.sops-nix.nixosModules.sops ];
  sops = { 
  defaultSopsFile = ./secrets/secrets.yaml;
  age = {
  keyFile = "/home/indransh/.config/sops/age/key.txt";
  generateKey = true;
  };
  secrets = { 
"sonarr/api_key" = {};
"sonarr/password" = {};
"radarr/api_key" = {};
"radarr/password" = {};
"lidarr/api_key" = {};
"lidarr/password" = {};
"prowlarr/api_key" = {};
"prowlarr/password" = {};
"jellyfin/api_key" = {};
"jellyfin/indranshs_password" = {};
  };
};
};
}

