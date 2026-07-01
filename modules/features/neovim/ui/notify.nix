{
  flake.nixosModules.neovim = {
    programs.nvf.settings.vim = {
      notify.nvim-notify = {
        enable = true;
      };
    };
  };
}
