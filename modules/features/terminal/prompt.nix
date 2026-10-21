{
  flake.modules.homeManager.terminal = { lib, ... }: {
    programs.starship = {
      enable = true;
      enableTransience = true;
      enableInteractive = true;
      enableFishIntegration = true;

      settings = {
        add_newline = false;

        format = lib.concatStrings [
          "$username"
          "$hostname"
          "$directory"
          "$git_branch"
          "$git_status"
          "$cmd_duration"
          "$fill"
          "$c"
          "$cpp"
          "$dart"
          "$lua"
          "$rust"
          "$nix_shell"
          "$jobs"
          "$line_break"
          "$character"
        ];

        username.format = "[$user]($style) ";
        hostname.format = "[$ssh_symbol]($style) @ [$hostname]($style) ";
        cmd_duration.format = "[$duration]($style)  ";
        fill.symbol = " ";
        dart.format = "[  $version]($style) ";    
        lua.format = "[󰢱  $version]($style) ";   
        rust.format = " [$symbol($version)]($style) ";
        nix_shell.format = "[$symbol$state( \\($name\\))]($style) ";
      };
    };
  };
}
