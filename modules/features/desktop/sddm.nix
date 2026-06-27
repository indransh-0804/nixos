{ inputs, ... }:
{
  flake-file.inputs.pixie-sddm.url = "github:xCaptaiN09/pixie-sddm";

  flake.nixosModules.sddm = { pkgs, ... }: {
  services.displayManager.sddm = {
    enable = true;
    autoNumlock = true;
    theme = "pixie";
    wayland.enable = true;
    package = pkgs.kdePackages.sddm;
    extraPackages = [
      pkgs.kdePackages.qtsvg
      pkgs.kdePackages.qtdeclarative
      pkgs.kdePackages.qt5compat
    ];
  };

  environment.systemPackages = [
    # Install and customize the theme. All fields are optional and will
    # fall back to theme defaults if not set.
    (inputs.pixie-sddm.packages.${pkgs.stdenv.hostPlatform.system}.pixie-sddm
    .override {
    #  background = ./my-background.jpg; # Nix path or absolute path
    #  avatar = ./my-avatar.jpg;         # Nix path or absolute path
    #  primaryColor = "#B3C8FF";         # Hex color code
    #  accentColor = "#3F5F91";          # Hex color code
    #  autoColor = true;                 # true/false
    #  backgroundColor = "#1A1C1E";      # Hex color code
    #  textColor = "#E2E2E6";            # Hex color code
     fontFamily = "Maple Mono NF";    # Font family name
     fontSize = 13;                    # Font size in px
    })
  ];
};
}
