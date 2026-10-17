{
  flake.modules.nixos.graphics = { pkgs, ... }: {
    hardware = { 
      amdgpu.initrd.enable = true;
    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [
      nvtopPackages.amd
      libva-utils
      vulkan-tools
      clinfo
      ];
    };
    };
  services.xserver.videoDrivers = [ "amdgpu" ];
  };
}
