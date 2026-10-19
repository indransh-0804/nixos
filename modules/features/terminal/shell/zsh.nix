{ inputs, ... }: {
  flake.modules.homeManager.zsh_shell = { config, pkgs, ... }: {
    programs.zsh = {
      enable = true;
      defaultKeymap = "emacs";
      dotDir = "${config.home.homeDirectory}/zsh";
      autocd = true;
      setOptions = [
        "NO_BEEP"
        "CORRECT"
      ];

      # zsh-autocomplete runs compinit itself, so don't let Home Manager
      # (or zsh_init.nix) run it a second time.
      enableCompletion = false;

      # Zsh features replaced by antidote plugins below
      autosuggestion.enable = false;      # replaced by deja
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
          "Giammarco-Ferranti/deja"
        ];
      };
    };
    home.packages = [ pkgs.deja ];
  };
}
