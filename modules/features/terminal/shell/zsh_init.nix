{ inputs, ... }: {
  flake.modules.homeManager.zsh_shell = { lib, ... }: {
    programs.zsh.initContent =
      let
        # Runs first: p10k instant prompt. No compinit here, zsh-autocomplete does it.
        zshEarlyInit = lib.mkOrder 500 ''
          typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
          if [[ -r "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh" ]]; then
            source "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh"
          fi
          zmodload zsh/complist
        '';

        # zstyle settings don't need compinit to have run yet
        zshCompStyles = lib.mkOrder 550 ''
          zstyle ':completion:*' completer _extensions _complete _approximate
          zstyle ':completion:*' use-cache on
          zstyle ':completion:*' cache-path "''${XDG_CACHE_HOME:-$HOME/.cache}/zsh/.zcompcache"
          zstyle ':completion:*' complete true
          zstyle ':completion:alias-expension:*' completer _expand_alias
          zstyle ':completion:*' menu yes
          zstyle ':completion:*' complete-options true
          zstyle ':completion:*:*:*:*:corrections' format '%F{yellow}!- %d (errors: %e) -! %f'
          zstyle ':completion:*:*:*:*:descriptions' format ' '
          zstyle ':completion:*:*:*:*:messages' format ' '
          zstyle ':completion:*:*:*:*:warnings' format ' '
          zstyle ':completion:*:*:*:*:default' list-colors ''${(s.:.)LS_COLORS}
          zstyle ':completion:*:*:cd:*' tag-order local-directories directory-stack path-directories
          zstyle ':completion:*' group-name ""
          zstyle ':completion:*:*:-command-:*:*' group-order aliases builtins functions commands
          zstyle ':completion:*' matcher-list "" 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
          zstyle ':completion:*' keep-prefix true
          zstyle -e ':completion:*:(ssh|scp|sftp|rsh|rsync):hosts' hosts 'reply=(''${=''${''${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })'
        '';

        # Runs after all plugins, so compinit has already been run by zsh-autocomplete.
        # deja is initialised by its own plugin file, so no `deja init` here.
        zshConfig = lib.mkOrder 1000 ''
          [[ -f ~/zsh/.p10k.zsh ]] && source ~/zsh/.p10k.zsh

          zle -C alias-expension complete-word _generic
          bindkey '^Xa' alias-expension

          compdef _files nvim
          compdef _files cat

if [[ -r "$HOME/.local/share/deja/init.zsh" ]]; then
  source "$HOME/.local/share/deja/init.zsh"
else
  eval "$(deja init zsh)"
fi
        '';
      in
        lib.mkMerge [ zshEarlyInit zshCompStyles zshConfig ];
  };
}
