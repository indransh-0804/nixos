{self, inputs, ...}:{
  flake.nixosModules.audio = 


  { config, pkgs, ... }:
  {
    environment.systemPackages = with pkgs; [
      pavucontrol        # GUI volume/device mixer (works with PipeWire via pulse compat)
        pipewire           # pw-cli, pw-dump, pw-top for debugging
        wireplumber        # wpctl — control volumes, switch devices from CLI
        helvum             # patchbay GUI — route audio between apps/devices visually
    ];
  };
                    }
