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
      font = {
        name = "Noto Sans Regular";
	size = 11;
      };
      iconTheme = { 
        name = "Bibata Modern Classic";
	package = pkgs.bibata_cursor;
      };
    };
    };
    };
    }
    
