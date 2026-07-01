{
  flake.nixosModules.neovim = { lib, ... }: {
    programs.nvf.settings.vim.binds.whichKey = {
      enable = true;
      setupOpts = lib.generators.mkLuaInline ''
        {
        preset = "modern",
        }
      '';
    };
  };
}
