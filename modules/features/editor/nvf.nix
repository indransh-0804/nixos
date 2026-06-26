{inputs, ...}:{
flake-file.inputs.nvf = {
url = "github:NotAShelf/nvf";
inputs.nixpkgs.follows = "nixpkgs";
};
flake.nixosModules.editor = {...}:{
imports = [ inputs.nvf.nixosModules.default ];
  programs.nvf = {
    enable = true;
    settings = {
      vim.viAlias = false;
      vim.vimAlias = true;
    };
  };
};
}
