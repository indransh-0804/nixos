{ self, inputs, ... }: {

flake.nixosModules.nixos = 
 
 { config, pkgs, ... }: {
    #home-manager.users.USERNAME = self.homeModules.USERNAMEModule;
    networking.hostName = "nixos";
    time.timeZone = "Asia/Kolkata";
    i18n.defaultLocale = "en_US.UTF-8";
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    nixpkgs.hostPlatform = "x86_64-linux";
    hardware.cpu.intel.updateMicrocode = true;
    system.stateVersion = "26.05";  # <- Never Ever Change That
    
    imports = with self.nixosModules; [
    system
    sops-nix
    filesystem
    indransh
    desktop
    ];
  };

}
