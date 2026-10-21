{ inputs, ... }: {

  flake.nixosModules.nixos =

    { config, pkgs, ... }: {
      imports = with inputs.self.modules.nixos; [
        features
        filesystem
        indransh
        system
	secrets
      ];

      networking.hostName = "nixos";
      time.timeZone = "Asia/Kolkata";
      i18n.defaultLocale = "en_US.UTF-8";
      nix.settings.experimental-features = [
        "nix-command"
        "flakes"
      ];
      nixpkgs.hostPlatform = "x86_64-linux";
      environment.pathsToLink = [ "/share/fish" ];
      hardware.cpu.amd.updateMicrocode = true;
      system.stateVersion = "26.05"; # <- Never Ever Change That
    };
}
