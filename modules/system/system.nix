{inputs, ...}:{
  flake.modules.nixos.system.imports = with inputs.self.modules.nixos; [
    boot
      kernel
      fonts
      security
      xdg
      audio
      network
      bluetooth
      graphics
      location
      power
      nix
      packages
  ];
                    }

