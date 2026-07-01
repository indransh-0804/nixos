{
  flake.nixosModules.neovim = {
    programs.nvf.settings.vim = {
      utility = {
        smart-splits.enable = true;
        undotree.enable = true;
        grug-far-nvim.enable = true;
        motion.flash-nvim.enable = true;
      };
      comments.comment-nvim.enable = true;
    };
  };
}
