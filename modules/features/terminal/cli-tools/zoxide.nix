{inputs, ...}:{
flake.homeManager.cli_tools = {
programs.zoxide = {
enable = true;
enableZshIntegration = true;
};
};
}

