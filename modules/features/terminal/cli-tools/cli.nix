{inputs, ...}:{
flake.modules.homeManager.cli_tools = {config, ...}:{
programs.bat.enable = true;
programs.direnv = {
enable = true;
silent = true;
enableZshIntegration = true;
nix-direnv.enable = true;
};
programs.eza = {
enable = true;
colors = "always";
git = true;
enableZshIntegration = true;
icons = "always";
};
programs.fzf = {
enable = true;
enableZshIntegration = true;
};
programs.ripgrep.enable = true;
programs.yazi = {
enable = true;
enableZshIntegration = true;
};
programs.zoxide = {
enable = true;
enableZshIntegration = true;
};
};
}

