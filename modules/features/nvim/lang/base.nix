{
  flake.modules.nixos.neovim = { lib, ... }: {
    programs.nvf.settings.vim = {
      languages = {
        enableFormat = true;
        enableTreesitter = true;
        enableExtraDiagnostics = true;
      };
    };
  };
}
