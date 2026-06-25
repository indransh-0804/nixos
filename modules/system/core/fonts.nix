{self, inputs, ...}:{
flake.nixosModules.fonts = { pkgs, ... }:
{
  fonts = {
    packages = with pkgs; [
      material-symbols

      libertinus
      (google-fonts.override { fonts = [ "Inter" ]; })

      jetbrains-mono

      nerd-fonts.jetbrains-mono
      nerd-fonts.symbols-only
    ];

    enableDefaultPackages = false;

    fontconfig.defaultFonts = {
      serif = [ "Libertinus Serif" ];
      sansSerif = [ "Inter" ];
      monospace = [ "JetBrains Mono Nerd Font" ];
    };
  };
};
}

