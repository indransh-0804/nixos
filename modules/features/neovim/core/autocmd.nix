{
  flake.nixosModules.neovim = { lib, ... }: {
    programs.nvf.settings.vim.autocmds = [
      {
        enable = true;
        event = [
          "FocusGained"
          "TermClose"
          "TermLeave"
        ];
        desc = "Auto-check if file changed when focus is regained";
        callback = lib.generators.mkLuaInline ''
          function()
            if vim.o.buftype ~= "nofile" then
              vim.cmd("checktime")
            end
          end
        '';
      }
      {
        enable = true;
        event = [ "VimResized" ];
        desc = "Resize splits if window size changes";
        callback = lib.generators.mkLuaInline ''
          function()
            local current_tab = vim.fn.tabpagenr()
            vim.cmd("tabdo wincmd =")
            vim.cmd("tabnext " .. current_tab)
          end
        '';
      }
      {
        enable = true;
        event = [ "BufReadPost" ];
        desc = "Go to last known cursor position when reopening a file";
        callback = lib.generators.mkLuaInline ''
          function(event)
            local ignore = { "gitcommit" }
            if vim.tbl_contains(ignore, vim.bo[event.buf].filetype) or vim.b[event.buf].user_last_loc then
              return
            end
            vim.b[event.buf].user_last_loc = true
            local mark = vim.api.nvim_buf_get_mark(event.buf, '"')
            local lcount = vim.api.nvim_buf_line_count(event.buf)
            if mark[1] > 0 and mark[1] <= lcount then
              pcall(vim.api.nvim_win_set_cursor, 0, mark)
            end
          end
        '';
      }
      {
        enable = true;
        event = [ "BufWritePre" ];
        desc = "Auto-create directory before writing file";
        callback = lib.generators.mkLuaInline ''
          function(event)
            if event.match:match("^%w%w+://") then
              return
            end
            local file = vim.uv.fs_realpath(event.match) or event.match
            local dir = vim.fn.fnamemodify(file, ":p:h")
            if vim.fn.isdirectory(dir) == 0 then
              vim.fn.mkdir(dir, "p")
            end
          end
        '';
      }
      {
        enable = true;
        event = [ "TextYankPost" ];
        desc = "Highlight on yank";
        callback = lib.generators.mkLuaInline ''
          function()
            (vim.highlight or vim.hl).on_yank({ timeout = 100 })
          end
        '';
      }
      {
        enable = true;
        event = [ "FileType" ];
        pattern = [
          "text"
          "plaintex"
          "typst"
          "gitcommit"
          "markdown"
        ];
        desc = "Enable wrap + spell checking for certain filetypes";
        callback = lib.generators.mkLuaInline ''
          function()
            vim.opt_local.wrap = true
            vim.opt_local.spell = true
          end
        '';
      }
      {
        enable = true;
        event = [ "FileType" ];
        pattern = [ "man" ];
        desc = "Make man pages unlisted";
        callback = lib.generators.mkLuaInline ''
          function(event)
            vim.bo[event.buf].buflisted = false
          end
        '';
      }
      {
        enable = true;
        event = [ "FileType" ];
        pattern = [
          "json"
          "jsonc"
          "json5"
        ];
        desc = "Disable conceal in JSON files";
        callback = lib.generators.mkLuaInline ''
          function()
            vim.opt_local.conceallevel = 0
          end
        '';
      }
    ];
  };
}
