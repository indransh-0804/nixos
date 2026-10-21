{inputs, ...}:{
flake.modules.homeManager.terminal = {config, ...}:{
programs.bat.enable = true;
programs.direnv = {
enable = true;
silent = true;
enableFishIntegration = true;
nix-direnv.enable = true;
};
programs.eza = {
enable = true;
colors = "always";
git = true;
enableFishIntegration = true;
icons = "always";
};
programs.fzf = {
enable = true;
enableFishIntegration = true;
};
programs.ripgrep.enable = true;
programs.yazi = {
enable = true;
enableFishIntegration = true;
};
programs.zoxide = {
enable = true;
enableFishIntegration = true;
};
};
}

