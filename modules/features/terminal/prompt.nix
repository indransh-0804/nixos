{
  flake.modules.homeManager.terminal = { lib, config, ... }: {
  programs.starship = {
    enable = true;
    enableTransience = true;
    enableInteractive = true;
    enableFishIntegration = true;
  };
  xdg.configFile."starship.toml".text = ''
add_newline = false
format = "$username$hostname$directory$git_branch$git_status$cmd_duration$fill$c$cpp$dart$lua$rust$nix_shell$jobs$line_break$character"
palette = "catppuccin_mocha"

[cmd_duration]
format = "[$duration]($style)  "

[dart]
format = "[ $version]($style) "

[fill]
symbol = " "

[hostname]
format = "[$ssh_symbol]($style) @ [$hostname]($style) "

[lua]
format = "[󰢱  $version]($style) "

[nix_shell]
format = "[$symbol$state( \\($name\\))]($style) "

[palettes.catppuccin_mocha]
base = "#1e1e2e"
blue = "#89b4fa"
crust = "#11111b"
flamingo = "#f2cdcd"
green = "#a6e3a1"
lavender = "#b4befe"
mantle = "#181825"
maroon = "#eba0ac"
mauve = "#cba6f7"
overlay0 = "#6c7086"
overlay1 = "#7f849c"
overlay2 = "#9399b2"
peach = "#fab387"
pink = "#f5c2e7"
red = "#f38ba8"
rosewater = "#f5e0dc"
sapphire = "#74c7ec"
sky = "#89dceb"
subtext0 = "#a6adc8"
subtext1 = "#bac2de"
surface0 = "#313244"
surface1 = "#45475a"
surface2 = "#585b70"
teal = "#94e2d5"
text = "#cdd6f4"
yellow = "#f9e2af"

[rust]
format = " [$symbol($version)]($style) "

[username]
format = "[$user]($style) "
  '';
  };
}
