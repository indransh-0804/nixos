{ inputs, ... }: {
  flake.modules.homeManager.zsh_shell = { config, pkgs, ... }: {
    programs.zsh = {
      enable = false;
      defaultKeymap = "emacs";
      dotDir = "${config.home.homeDirectory}/zsh";
      autocd = true;
      setOptions = [
        "NO_BEEP"
        "CORRECT"
      ];

      enableCompletion = false;
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

      antidote = {
        enable = true;
        plugins = [
          "romkatv/powerlevel10k"
          "marlonrichert/zsh-autocomplete"
	  "Aloxaf/fzf-tab"
        ];
      };
    };
  };
}
