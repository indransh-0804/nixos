{
flake.modules.homeManager.gtk = {pkgs, ...}: {
  gtk = { 
    enable = true;
    theme = { 
      name = "catppuccin-mocha-blue-compact+default";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "blue" ];
	size = "compact";
	tweaks = [ "black" ];
	variant = "mocha";
      };
      };
      font = {
        name = "Noto Sans Regular";
	size = 11;
      };
      cursorTheme = { 
        name = "Bibata Modern Classic";
	size = 22;
	package = pkgs.bibata_cursor;
      };
      gtk3.extraConfig.Settings = ''gtk-application-prefer-dark-themes=1'';
      gtk4.extraConfig.Settings = ''gtk-application-prefer-dark-themes=1'';
    };
    };
    }
    
