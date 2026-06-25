{ self, ... }: {
  flake.nixosModules.indransh =
    { pkgs, ... }:  
    {
      users.users.indransh = {
        description = "Indransh Sharma";
        shell = pkgs.zsh;
        createHome = true;
        isNormalUser = true;
        extraGroups = [
          "wheel"
          "networkmanager"
        ];
        packages = with pkgs ; [ zsh kitty vim git ];  
      };

      programs = {
      zsh.enable = true;
      firefox.enable = true;
      };
    };
}
