{inputs, ...}:{
flake-file.inputs.sops-nix = {
url = "github:Mic92/sops-nix";
inputs.nixpkgs.follows = "nixpkgs";
};
flake.nixosModules.sops-nix = {
imports = [ inputs.sops-nix.nixosModules.sops ];
sops = {
defaultSopsFile = ../../../secrets/secrets.yaml;
defaultSopsFormat = "yaml";
age.keyFile = "/home/indransh/.config/sops/age/keys.txt";

secrets = {
github_ssh_key = {
owner = "indransh";
path = "/home/indransh/.ssh/id_ed25519";
};
};
};
};
}

