{inputs, ...}:{
flake.nixosModules.neovim = {config, ...}:{
programs.nvf.settings.vim = { 
lsp = { 
enable = true;
formatOnSave = true;
inlayHints.enable = true;
lspSignature.enable = true;
};
};
};
}
