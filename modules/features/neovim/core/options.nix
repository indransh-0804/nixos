{ inputs, ... }: {
  flake.nixosModules.neovim = {
    programs.nvf.settings.vim = {
      hideSearchHighlight = true;
      syntaxHighlighting = true;
      preventJunkFiles = true;
      bell = "visual";
      searchCase = "smart";
      mini.cursorword.enable = true;
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
        backup = false;
        breakindent = true;
        cmdheight = 0;
        conceallevel = 0;
        confirm = true;
        cursorline = true;
        cursorlineopt = "both";
        expandtab = true;
        fileencoding = "utf-8";
        hidden = true;
        guicursor = "a:hor15";
        linebreak = true;
        mouse = "a";
        numberwidth = 4;
        shiftwidth = 2;
        showmode = false;
        softtabstop = 2;
        signcolumn = "yes";
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
      luaConfigRC.options = inputs.nvf.lib.nvim.dag.entryAnywhere ''
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
      '';
    };

  };
}
