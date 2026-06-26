{inputs, ...}:{
  flake.homeModules.zsh_shell = {
    programs.zsh = {
      enable = true;
      defaultKeymap = "emacs";
      dotDir = "`\${config.xdg.configHome}/zsh`";
      autocd = true;
      setOptions = [ 
        "NO_BEEP"
        "CORRECT"
      ];

# Highlight and Suggestions
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
        path = "`\${config.programs.zsh.dotDir}/.zsh_history`";
      };

# Zsh Plugins 
      antidote = {
        enable = true
          plugins = [
          "romkatv/powerlevel10k"
          "marlonrichert/zsh-autocomplete"
          "Aloxaf/fzf-tab"
          ];
      };
    };
  };
              }
