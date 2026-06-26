{inputs, ...}:{
flake.homeModules.cli_tools = {config, ...}:{
programs.direnv = {
enable = true;
silent = true;
enableZshIntegration = true;
nix-direnv.enable = true;
};
};
}
