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
        vim.api.nvim_set_hl(0, "Pmenu", { bg = "#313244", fg = "#cdd6f4" })       -- surface0, text
        vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#45475a", fg = "#cdd6f4", bold = true }) -- surface1, text
        vim.api.nvim_set_hl(0, "PmenuBorder", { fg = "#585b70", bg = "#313244" }) -- surface2, surface0
        vim.api.nvim_set_hl(0, "PmenuThumb", { bg = "#585b70" })                 -- surface2
        vim.api.nvim_set_hl(0, "CmpGhostText", { fg = "#6c7086", italic = true }) -- overlay0
      '';
    };

  };
}
