{inputs, ...}:{
  flake.homeModules.zsh_shell = {config, ...}: {
    programs.zsh = {
      enable = true;
      defaultKeymap = "emacs";
      dotDir = "${config.home.homeDirectory}/zsh";
      autocd = true;
      setOptions = [ 
        "NO_BEEP"
        "CORRECT"
      ];

# Zsh Features 
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;

# History
      history = {
        append = true;
        extended = true;
        share = true;
        ignoreAllDups = true;
        ignoreDups = true;
        size = 9999;
        saveNoDups = true;
        path = "${config.home.homeDirectory}/zsh/.zsh_history";
      };

# Zsh Plugins 
      antidote = {
        enable = true;
          plugins = [
          "romkatv/powerlevel10k"
          "marlonrichert/zsh-autocomplete"
          # "Aloxaf/fzf-tab"
          ];
      };
    };
  };
              }
