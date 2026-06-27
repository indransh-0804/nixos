{self, inputs, ...}:{
flake.nixosModules.fonts = { pkgs, ... }:
{
  fonts = {
    packages = with pkgs; [
      nerd-fonts.symbols-only
      maple-mono.NF
      inter
      fira-code
    ];

    enableDefaultPackages = false;

    fontconfig.defaultFonts = {
      serif = [ "Inter" ];
      sansSerif = [ "Inter" ];
      monospace = [ "Maple Mono NF" "Fira Code" ];
    };
  };
};
}

