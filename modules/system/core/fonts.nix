{self, inputs, ...}:{
flake.nixosModules.fonts = { pkgs, ... }:
{
  fonts = {
    packages = with pkgs; [
      material-symbols

      libertinus
      (google-fonts.override { fonts = [ "Inter" ]; })

      nerd-fonts.symbols-only

      monaspace
      maple-mono.variable
    ];

    enableDefaultPackages = false;

    fontconfig.defaultFonts = {
      serif = [ "Libertinus Serif" ];
      sansSerif = [ "Inter" ];
      monospace = [ "Monaspace Neon" "Maple Mono" ];
    };
  };
};
}

