{inputs, ...}:{
flake.homeManager.cli_tools = {
programs.eza = {
enable = true;
colors = "always";
git = true;
enableZshIntegration = true;
icons = "always";
};
};
}
