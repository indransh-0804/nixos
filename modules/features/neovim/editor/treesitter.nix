{inputs, ...}:{
  flake.nixosModules.neovim = {config, pkgs, ...}:{
    programs.nvf.settings.vim = {
      treesitter = {
        enable = true;
        autotagHtml = true;
        addDefaultGrammars = true;
        highlight.enable = true;
        indent.enable = true;
        grammars = with pkgs.vimPlugins.nvim-treesitter-parsers; [
        lua 
        luadoc
        nix
        yaml
        toml
        rust
        dart
        vim
        vimdoc
        zsh
        diff
        gitcommit
        gitignore
        git_config
        git_rebase
        ];
      };
    };
  };
}

