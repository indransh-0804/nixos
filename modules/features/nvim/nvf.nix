{ inputs, ... }: {
  flake-file.inputs.nvf = {
    url = "github:NotAShelf/nvf";
    inputs.nixpkgs.follows = "nixpkgs";
  };
  flake.modules.nixos.neovim = { lib, ... }: {
    imports = [ inputs.nvf.nixosModules.default ];
    programs.nvf = {
      enable = true;
      settings.vim = {
        viAlias = false;
        vimAlias = true;
        enableLuaLoader = true;
      };
    };
  };
}
