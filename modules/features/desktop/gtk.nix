{
  flake.modules.homeManager.gtk = { config, pkgs, ... }: {
    gtk = {
      enable = true;

      theme = {
        name = "catppuccin-mocha-blue-compact+black";
        package = pkgs.catppuccin-gtk.override {
          accents = [ "blue" ];
          size = "compact";
          tweaks = [ "black" ];
          variant = "mocha";
        };
      };

      iconTheme = {
        name = "Papirus-Dark";
        package = pkgs.papirus-icon-theme;
      };

      font = {
        name = "Noto Sans";
        size = 11;
        package = pkgs.noto-fonts;
      };

      gtk3.extraConfig.gtk-application-prefer-dark-theme = true;
      gtk4.extraConfig.gtk-application-prefer-dark-theme = true;
      # gtk4.theme = config.gtk.theme;  # uncomment if GTK4/libadwaita apps ignore the theme
    };

    home.pointerCursor = {
      name = "Bibata-Modern-Classic";
      package = pkgs.bibata-cursors;
      size = 22;
      gtk.enable = true;
      x11.enable = true;
    };

    dconf.settings."org/gnome/desktop/interface".color-scheme = "prefer-dark";
  };
}
