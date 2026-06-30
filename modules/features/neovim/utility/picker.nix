{
  flake.nixosModules.neovim = {
    programs.nvf.settings.vim.keymaps = [
      # Top Pickers & Explorer
      {
        key = "<leader><space>";
        mode = "n";
        silent = true;
        action = "<cmd>lua Snacks.picker.smart()<CR>";
        desc = "Smart Find Files";
      }
      {
        key = "<leader>,";
        mode = "n";
        silent = true;
        action = "<cmd>lua Snacks.picker.buffers()<CR>";
        desc = "Buffers";
      }
      {
        key = "<leader>/";
        mode = "n";
        silent = true;
        action = "<cmd>lua Snacks.picker.grep()<CR>";
        desc = "Grep";
      }
      {
        key = "<leader>:";
        mode = "n";
        silent = true;
        action = "<cmd>lua Snacks.picker.command_history()<CR>";
        desc = "Command History";
      }
      {
        key = "<leader>n";
        mode = "n";
        silent = true;
        action = "<cmd>lua Snacks.picker.notifications()<CR>";
        desc = "Notification History";
      }
      {
        key = "<leader>e";
        mode = "n";
        silent = true;
        action = "<cmd>lua Snacks.explorer()<CR>";
        desc = "File Explorer";
      }

      # find
      {
        key = "<leader>fb";
        mode = "n";
        silent = true;
        action = "<cmd>lua Snacks.picker.buffers()<CR>";
        desc = "Buffers";
      }
      {
        key = "<leader>ff";
        mode = "n";
        silent = true;
        action = "<cmd>lua Snacks.picker.files()<CR>";
        desc = "Find Files";
      }
      {
        key = "<leader>fg";
        mode = "n";
        silent = true;
        action = "<cmd>lua Snacks.picker.git_files()<CR>";
        desc = "Find Git Files";
      }
      {
        key = "<leader>fp";
        mode = "n";
        silent = true;
        action = "<cmd>lua Snacks.picker.projects()<CR>";
        desc = "Projects";
      }
      {
        key = "<leader>fr";
        mode = "n";
        silent = true;
        action = "<cmd>lua Snacks.picker.recent()<CR>";
        desc = "Recent";
      }

      # git
      {
        key = "<leader>gb";
        mode = "n";
        silent = true;
        action = "<cmd>lua Snacks.picker.git_branches()<CR>";
        desc = "Git Branches";
      }
      {
        key = "<leader>gl";
        mode = "n";
        silent = true;
        action = "<cmd>lua Snacks.picker.git_log()<CR>";
        desc = "Git Log";
      }
      {
        key = "<leader>gL";
        mode = "n";
        silent = true;
        action = "<cmd>lua Snacks.picker.git_log_line()<CR>";
        desc = "Git Log Line";
      }
      {
        key = "<leader>gs";
        mode = "n";
        silent = true;
        action = "<cmd>lua Snacks.picker.git_status()<CR>";
        desc = "Git Status";
      }
      {
        key = "<leader>gS";
        mode = "n";
        silent = true;
        action = "<cmd>lua Snacks.picker.git_stash()<CR>";
        desc = "Git Stash";
      }
      {
        key = "<leader>gd";
        mode = "n";
        silent = true;
        action = "<cmd>lua Snacks.picker.git_diff()<CR>";
        desc = "Git Diff (Hunks)";
      }
      {
        key = "<leader>gf";
        mode = "n";
        silent = true;
        action = "<cmd>lua Snacks.picker.git_log_file()<CR>";
        desc = "Git Log File";
      }

      # gh
      {
        key = "<leader>gi";
        mode = "n";
        silent = true;
        action = "<cmd>lua Snacks.picker.gh_issue()<CR>";
        desc = "GitHub Issues (open)";
      }
      {
        key = "<leader>gI";
        mode = "n";
        silent = true;
        action = "<cmd>lua Snacks.picker.gh_issue({ state = 'all' })<CR>";
        desc = "GitHub Issues (all)";
      }
      {
        key = "<leader>gp";
        mode = "n";
        silent = true;
        action = "<cmd>lua Snacks.picker.gh_pr()<CR>";
        desc = "GitHub Pull Requests (open)";
      }
      {
        key = "<leader>gP";
        mode = "n";
        silent = true;
        action = "<cmd>lua Snacks.picker.gh_pr({ state = 'all' })<CR>";
        desc = "GitHub Pull Requests (all)";
      }

      # Grep
      {
        key = "<leader>sb";
        mode = "n";
        silent = true;
        action = "<cmd>lua Snacks.picker.lines()<CR>";
        desc = "Buffer Lines";
      }
      {
        key = "<leader>sB";
        mode = "n";
        silent = true;
        action = "<cmd>lua Snacks.picker.grep_buffers()<CR>";
        desc = "Grep Open Buffers";
      }
      {
        key = "<leader>sg";
        mode = "n";
        silent = true;
        action = "<cmd>lua Snacks.picker.grep()<CR>";
        desc = "Grep";
      }
      {
        key = "<leader>sw";
        mode = [
          "n"
          "x"
        ];
        silent = true;
        action = "<cmd>lua Snacks.picker.grep_word()<CR>";
        desc = "Visual selection or word";
      }

      # search
      {
        key = "<leader>s\"";
        mode = "n";
        silent = true;
        action = "<cmd>lua Snacks.picker.registers()<CR>";
        desc = "Registers";
      }
      {
        key = "<leader>s/";
        mode = "n";
        silent = true;
        action = "<cmd>lua Snacks.picker.search_history()<CR>";
        desc = "Search History";
      }
      {
        key = "<leader>sa";
        mode = "n";
        silent = true;
        action = "<cmd>lua Snacks.picker.autocmds()<CR>";
        desc = "Autocmds";
      }
      {
        key = "<leader>sc";
        mode = "n";
        silent = true;
        action = "<cmd>lua Snacks.picker.command_history()<CR>";
        desc = "Command History";
      }
      {
        key = "<leader>sC";
        mode = "n";
        silent = true;
        action = "<cmd>lua Snacks.picker.commands()<CR>";
        desc = "Commands";
      }
      {
        key = "<leader>sd";
        mode = "n";
        silent = true;
        action = "<cmd>lua Snacks.picker.diagnostics()<CR>";
        desc = "Diagnostics";
      }
      {
        key = "<leader>sD";
        mode = "n";
        silent = true;
        action = "<cmd>lua Snacks.picker.diagnostics_buffer()<CR>";
        desc = "Buffer Diagnostics";
      }
      {
        key = "<leader>sh";
        mode = "n";
        silent = true;
        action = "<cmd>lua Snacks.picker.help()<CR>";
        desc = "Help Pages";
      }
      {
        key = "<leader>sH";
        mode = "n";
        silent = true;
        action = "<cmd>lua Snacks.picker.highlights()<CR>";
        desc = "Highlights";
      }
      {
        key = "<leader>si";
        mode = "n";
        silent = true;
        action = "<cmd>lua Snacks.picker.icons()<CR>";
        desc = "Icons";
      }
      {
        key = "<leader>sj";
        mode = "n";
        silent = true;
        action = "<cmd>lua Snacks.picker.jumps()<CR>";
        desc = "Jumps";
      }
      {
        key = "<leader>sk";
        mode = "n";
        silent = true;
        action = "<cmd>lua Snacks.picker.keymaps()<CR>";
        desc = "Keymaps";
      }
      {
        key = "<leader>sl";
        mode = "n";
        silent = true;
        action = "<cmd>lua Snacks.picker.loclist()<CR>";
        desc = "Location List";
      }
      {
        key = "<leader>sm";
        mode = "n";
        silent = true;
        action = "<cmd>lua Snacks.picker.marks()<CR>";
        desc = "Marks";
      }
      {
        key = "<leader>sM";
        mode = "n";
        silent = true;
        action = "<cmd>lua Snacks.picker.man()<CR>";
        desc = "Man Pages";
      }
      {
        key = "<leader>sp";
        mode = "n";
        silent = true;
        action = "<cmd>lua Snacks.picker.lazy()<CR>";
        desc = "Search for Plugin Spec";
      }
      {
        key = "<leader>sq";
        mode = "n";
        silent = true;
        action = "<cmd>lua Snacks.picker.qflist()<CR>";
        desc = "Quickfix List";
      }
      {
        key = "<leader>sR";
        mode = "n";
        silent = true;
        action = "<cmd>lua Snacks.picker.resume()<CR>";
        desc = "Resume";
      }
      {
        key = "<leader>su";
        mode = "n";
        silent = true;
        action = "<cmd>lua Snacks.picker.undo()<CR>";
        desc = "Undo History";
      }
      {
        key = "<leader>uC";
        mode = "n";
        silent = true;
        action = "<cmd>lua Snacks.picker.colorschemes()<CR>";
        desc = "Colorschemes";
      }
    ];
  };
}
