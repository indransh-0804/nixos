{ self, inputs, ... }: {

flake.nixosModules.nixos = 
 
 { config, pkgs, ... }: {
    imports = with self.nixosModules; [
    features
    filesystem
    indransh
    sops-nix
    system
    ];
    
    networking.hostName = "nixos";
    time.timeZone = "Asia/Kolkata";
    i18n.defaultLocale = "en_US.UTF-8";
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    nixpkgs.hostPlatform = "x86_64-linux";
    hardware.cpu.intel.updateMicrocode = true;
    system.stateVersion = "26.05";  # <- Never Ever Change That
  };
}
