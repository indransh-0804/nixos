{
  flake.modules.nixos.graphics = { pkgs, ... }: {
    hardware.amdgpu.initrd.enable = true;

    hardware.graphics = {
      enable = true;
      enable32Bit = true;
    };

    environment.systemPackages = with pkgs; [
      mangohud
      winetricks
      vulkan-tools
      libva-utils
      clinfo
      lutris
    ];

 programs = { 
 steam = {
  enable = true;
  extraCompatPackages = [ pkgs.proton-ge-bin ];
};
gamemode.enable = true;
gamescope.enable = true;
};

  };
}
