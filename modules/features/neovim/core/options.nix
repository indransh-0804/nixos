{inputs, ...}:{
  flake.nixosModules.neovim = {...}:{
    programs.nvf.settings.vim = {
        visuals.highlight-undo.enable = true;
        clipboard = {
          enable = true;
          registers = "unnamedplus";
        };
        globals = {
          mapleader = " ";
          maplocalleader = " ";
        };
        options = {
          autoindent = true;
          backspace = { "indent", "eol", "start" };
          backup = false;
          breakindent = true;
          cmdheight = 0;
          completeopt = { "menuone", "noselect", "noinsert" };
          conceallevel = 0;
          confirm = true;
          cursorlineopt = "both";
          expandtab = true;
          fileencoding = "utf-8";
          hlsearch = true;
          hidden = true; 
          guicursor = "a:hor1";
          linebreak = true;
          mouse = "a";
          numberwidth = 2;
          shiftwidth = 2;
          showmode = false;
          softtabstop = 2;
          signcolumn = "yes";
          smartcase = true;
          splitbelow = true;
          splitright = true;
          swapfile = false;
          tabstop = 2;
          termguicolors = true;
          tm = 300;
          updatetime = 250;
          undofile = true;
          virtualedit = "block"; 
          wildmode = "longest:full,full";
          wrap = true;
          writebackup = false;
        };
        luaConfigRC =  { 
          options = lib.nvim.dag.entryAnywhere ''
            vim.opt.formatoptions:remove({ "c", "r", "o" }) -- Don't auto-insert comment leader
            vim.opt.shortmess:append({ W = true, I = true, c = true, C = true })
            vim.opt.iskeyword:append("-") -- Treat `-` as part of a word
            vim.opt.fillchars:append({
                foldopen = "",
                foldclose = "",
                fold = " ",
                foldsep = " ",
                diff = "╱",
                eob = " ",
                })
          ''};

      };
    };
              }
