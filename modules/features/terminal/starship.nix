{
  flake.modules.homeManager.starship = { lib, ... }: {
    programs.starship = {
      enable = true;
      enableTransience = true;
      enableInteractive = true;
      enableFishIntegration = true;

      settings = {
        add_newline = false;
        continuation_prompt = "[ ](dimmed subtext1)";

        format = lib.concatStrings [ 
	  "$username"
	  "$hostname"
	  "$directory"
	  "$git_branch"
	  "$git_metrics"
	  "$cmd_duration"
	  "$fill"
	  "$c"
	  "$cpp"
	  "$dart"
	  "$lua"
	  "$python"
	  "$rust"
	  "$nix_shell"
	  "$aws"
	  "$dir_env"
	  "$jobs"
	  "$line_break"
	  "$character"
	  ];

        fill.symbol = " ";

        character = {
          format = "$symbol ";
          success_symbol = "[❯ ](bold green)";
          error_symbol = "[❯ ](bold red)";
          vimcmd_symbol = "[❮ ](bold mauve)";
        };

        username = {
          style_user = "peach bold italic";
          style_root = "purple bold italic";
          format = "[$user]($style)";
          disabled = false;
          show_always = true;
        };

hostname = { 
ssh_only = false;
format = "@[$hostname](bold italic mauve) ";
disabled = false;
};


        directory = {
          home_symbol = " ";
          truncation_length = 3;
          read_only = " ";
          use_os_path_sep = true;
          style = "italic blue";
          format = "[ $path]($style)[$read_only]($read_only_style)";
          repo_root_style = "bold blue";
          repo_root_format = "[$before_root_path]($before_repo_root_style)[$repo_root]($repo_root_style)[$path]($style)[$read_only]($read_only_style)";
        };

        cmd_duration = {
          min_time = 500;
          format = "[ $duration ](italic subtext1)[ ](subtext1) ";
        };

        jobs = {
          format = "[$symbol$number]($style) ";
          style = "white";
          symbol = "[▶](blue italic)";
        };

        git_branch = {
          format = " [$branch(:$remote_branch)]($style)";
          symbol = "[󰘬 ](bold green)";
          style = "italic green";
          truncation_symbol = "...";
          truncation_length = 11;
          ignore_branches = [ ];
        };

        git_metrics = {
          format = "([ $added]($added_style))([ $deleted]($deleted_style))";
          added_style = "italic dimmed green";
          deleted_style = "italic dimmed red";
          ignore_submodules = true;
          disabled = false;
        };

        lua = {
          format = " [lua](italic) [\${symbol}\${version}]($style)";
          version_format = "\${raw}";
          symbol = "󰢱 ";
          style = "bold lavender";
        };

        python = {
          format = " [py](italic) [\${symbol}\${version}]($style)";
          symbol = "[ ](bold bright-blue)";
          version_format = "\${raw}";
          style = "bold yellow";
        };

        rust = {
          format = " [rs](italic) [$symbol$version]($style)";
          symbol = " ";
          version_format = "\${raw}";
          style = "bold red";
        };

        aws = {
          disabled = true;
          format = " [aws](italic) [$symbol $profile $region]($style)";
          symbol = "  ";
        };

        c = {
          symbol = " ";
          format = " [$symbol($version(-$name))]($style)";
        };

        dart = {
          symbol = " ";
          format = " dart [$symbol($version )]($style)";
        };

        docker_context = {
          symbol = "  ";
          format = " docker [$symbol$context]($style)";
        };

        nix_shell = {
          style = "bold italic dimmed blue";
          symbol = " ";
          format = "[$symbol nix $state ]($style) [$name](italic dimmed text)";
        };
      };
    };
  };
}
