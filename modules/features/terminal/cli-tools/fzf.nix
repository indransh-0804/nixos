{inputs, ...}:{
flake.homeManager.cli_tools = {
programs.fzf = {
enable = true;
enableZshIntegration = true;
};
};
}
