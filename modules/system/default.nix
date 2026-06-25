{self, ...}:{
  flake.nixosModules.system.imports = with self.nixosModules; [
    boot
      kernel
      firmware
      fonts
      security
      xdg
      audio
      network
      bluetooth
      gnome
      location
      power
      nix
  ];
                    }

