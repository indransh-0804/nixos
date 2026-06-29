{inputs, ...}:{
  flake.nixosModules.neovim = { lib, ...}:{
    programs.nvf.settings.vim.keymaps = [
# Window navigation
    {
      key = "<C-Up>";
      mode = "n";
      action = "<C-w>k";
      desc = "Go to Upper Window";
    }
    {
      key = "<C-Down>";
      mode = "n";
      action = "<C-w>j";
      desc = "Go to Lower Window";
    }
    {
      key = "<C-Left>";
      mode = "n";
      action = "<C-w>h";
      desc = "Go to Left Window";
    }
    {
      key = "<C-Right>";
      mode = "n";
      action = "<C-w>l";
      desc = "Go to Right Window";
    }

# Window resizing
    {
      key = "<C-h>";
      mode = "n";
      action = "<cmd>resize +2<cr>";
      desc = "Increase Window Height";
    }
    {
      key = "<C-j>";
      mode = "n";
      action = "<cmd>resize -2<cr>";
      desc = "Decrease Window Height";
    }
    {
      key = "<C-k>";
      mode = "n";
      action = "<cmd>vertical resize -2<cr>";
      desc = "Decrease Window Width";
    }
    {
      key = "<C-l>";
      mode = "n";
      action = "<cmd>vertical resize +2<cr>";
      desc = "Increase Window Width";
    }

# Move lines
    {
      key = "<A-Up>";
      mode = [ "n" "i" "v" ];
      action = "<cmd>move .-2<cr>==";
      desc = "Move Line Up";
    }
    {
      key = "<A-Down>";
      mode = [ "n" "i" "v" ];
      action = "<cmd>move .+1<cr>==";
      desc = "Move Line Down";
    }

# Buffers
    {
      key = "<A-Left>";
      mode = "n";
      action = "<cmd>bprevious<cr>";
      desc = "Prev Buffer";
    }
    {
      key = "<A-Right>";
      mode = "n";
      action = "<cmd>bnext<cr>";
      desc = "Next Buffer";
    }

# Save
    {
      key = "<C-x>";
      mode = [ "i" "x" "n" "s" ];
      action = "<cmd>wqa<cr>";
      desc = "Save File";
    }

# Commenting
    {
      key = "gco";
      mode = "n";
      action = "o<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>";
      desc = "Add Comment Below";
    }
    {
      key = "gcO";
      mode = "n";
      action = "O<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>";
      desc = "Add Comment Above";
    }

# New file
    {
      key = "<leader>fn";
      mode = "n";
      action = "<cmd>enew<cr>";
      desc = "New File";
    }

# Diagnostics
    {
      key = "<leader>dd";
      mode = "n";
      lua = true;
      action = "function() vim.diagnostic.open_float() end";
      desc = "Line Diagnostics";
    }
    {
      key = "<leader>dn";
      mode = "n";
      lua = true;
      action = "function() vim.diagnostic.goto_next() end";
      desc = "Next Diagnostic";
    }
    {
      key = "<leader>dp";
      mode = "n";
      lua = true;
      action = "function() vim.diagnostic.goto_prev() end";
      desc = "Prev Diagnostic";
    }

# Error diagnostics
    {
      key = "<leader>en";
      mode = "n";
      lua = true;
      action = "function() vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR }) end";
      desc = "Next Error";
    }
    {
      key = "<leader>ep";
      mode = "n";
      lua = true;
      action = "function() vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR }) end";
      desc = "Prev Error";
    }

# Warning diagnostics
    {
      key = "<leader>wn";
      mode = "n";
      lua = true;
      action = "function() vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.WARN }) end";
      desc = "Next Warning";
    }
    {
      key = "<leader>wp";
      mode = "n";
      lua = true;
      action = "function() vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.WARN }) end";
      desc = "Prev Warning";
    }

# Highlight under cursor
    {
      key = "<leader>ui";
      mode = "n";
      lua = true;
      action = "function() vim.show_pos() end";
      desc = "Inspect Pos";
    }
    ];
  };
              }
