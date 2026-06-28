{inputs, ...}:{
  flake.nixosModules.neovim = {config, ...}:{
    programs.nvf.settings.vim.diagnostics.nvim-lint = {
      enable = true;
      lint_after_save = true;
      linters_by_ft = {
        rust = [ "clippy" ];
        lua = [ "selene" ];
        dart = [ "dart_analyze" ];
        nix = ["statix" ];
        zsh = [ "shellcheck" ];
      };
    };
  };
              }
