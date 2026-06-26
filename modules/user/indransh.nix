{ self, inputs, ... }: {
  flake.nixosModules = {
    indransh =
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


    };
    homeManager = {pkgs, ...}:{
      imports = [
        inputs.home-manager.nixosModules.default
      ];
      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        extraSpecialArgs = {inherit inputs; };
        backupFileExtension = "hm-backup";
        users.indransh = self.homeModules.indransh;
      };
    };
  };
               }
