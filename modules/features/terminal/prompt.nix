{
flake.modules.homeManager.terminal = {
  programs.starship = {
    enable = true;
    enableTransience = true;
    enableInteractive = true;
    enableFishIntegration = true;
  };
};
}

