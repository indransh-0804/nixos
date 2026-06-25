{inputs, ...}:{
flake-file.inputs.nh.url = "github:nix-community/nh";
flake.nixosModules.nix = {
  programs.nh = {
    enable = true;
    flake = "/home/indransh/.nixos";
    clean = {
      enable = true;
      extraArgs = "--keep-since 21d --keep 3";
    };
  };
};
}
