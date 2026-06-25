{ inputs, ... }:
{

  imports = [ 
  inputs.flake-file.flakeModules.dendritic
  inputs.home-manager.flakeModules.home-manager
  ];

  flake-file.inputs = {
  flake-parts.url = "github:hercules-ci/flake-parts";
  flake-file.url = "github:denful/flake-file";
  import-tree.url = "github:vic/import-tree";
  nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  systems.url = "github:nix-systems/default";
  home-manager = {
    url = "github:nix-community/home-manager";
    inputs.nixpkgs.follows = "nixpkgs";
  };
};
}
