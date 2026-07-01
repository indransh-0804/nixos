{
  flake.nixosModules.neovim = {
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
        mode = [
          "n"
          "i"
          "v"
        ];
        action = "<cmd>move .-2<cr>==";
        desc = "Move Line Up";
      }
      {
        key = "<A-Down>";
        mode = [
          "n"
          "i"
          "v"
        ];
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

      # New file
      {
        key = "<leader>fn";
        mode = "n";
        action = "<cmd>enew<cr>";
        desc = "New File";
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
