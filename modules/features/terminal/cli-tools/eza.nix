{inputs, ...}:{
flake.homeModules.cli_tools = {config, ...}:{
programs.eza = {
enable = true;
colors = "always";
git = true;
enableZshIntegration = true;
icons = "always";
};
};
}
