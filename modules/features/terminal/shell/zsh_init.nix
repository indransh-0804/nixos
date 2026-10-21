{ inputs, ... }: {
  flake.modules.homeManager.zsh_shell = { lib, ... }: {
    programs.zsh.initContent =
      let
        zshEarlyInit = lib.mkOrder 500 ''
          typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
          if [[ -r "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh" ]]; then
            source "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh"
          fi

          source "''${XDG_CACHE_HOME:-$HOME/.cache}/antidote/github.com/marlonrichert/zsh-autocomplete/zsh-autocomplete.plugin.zsh"
        '';

        zshCompStyles = lib.mkOrder 550 ''
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "''${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu yes
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'
        '';

        zshConfig = lib.mkOrder 1000 ''
          [[ -f ~/zsh/.p10k.zsh ]] && source ~/zsh/.p10k.zsh

          zle -C alias-expension complete-word _generic
          bindkey '^Xa' alias-expension

          compdef _files nvim
          compdef _files cat

eval "$(fzf --zsh)"
        '';
      in
        lib.mkMerge [ zshEarlyInit zshCompStyles zshConfig ];
  };
}
