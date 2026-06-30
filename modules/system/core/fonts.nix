{
  flake.nixosModules.fonts =
    { pkgs, ... }:
    {
      fonts = {
        packages = with pkgs; [
          nerd-fonts.symbols-only
          maple-mono.truetype
          fira-code
          noto-fonts

        ];

        enableDefaultPackages = false;

        fontconfig.defaultFonts = {
          serif = [ ];
          sansSerif = [ ];
          monospace = [
            "Maple Mono"
            "Cascadia Code"
          ];
        };
      };
    };
}
