{ inputs, ... }: {
  flake.modules.nixos.indransh =
    { pkgs, ... }:  
    {
      users.users.indransh = {
        description = "Indransh Sharma";
        shell = pkgs.fish;
        createHome = true;
        isNormalUser = true;
        extraGroups = [
          "wheel"
            "networkmanager"
        ];
        packages = with pkgs ; [ fish neovim git ];  
      };


    };
    flake.nixosModules.homeManager = {pkgs, ...}:{
      imports = [
        inputs.home-manager.nixosModules.default
      ];
      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        extraSpecialArgs = {inherit inputs; };
        backupFileExtension = "hm-backup";
        users.indransh = inputs.self.modules.homeManager.indransh;
      };
    };
               }
