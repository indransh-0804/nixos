{inputs, ...}:{
  flake.homeModules.zsh_shell = 
{ lib, ... }: {
  programs.zsh = {
    initContent =
      let
 # zsh_init.nix
zshEarlyInit = lib.mkOrder 500''
  typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
  if [[ -r "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh" ]]; then
    source "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh"
  fi
    zmodload zsh/complist
    autoload -U compinit && compinit
''; 
        zshCompInit = lib.mkOrder 550 ''
    zstyle ':completion:*' completer _extensions _complete _approximate
    zstyle ':completion:*' use-cache on
    zstyle ':completion:*' cache-path "''${XDG_CACHE_HOME}/zsh/.zcompcache"
    zstyle ':completion:*' complete true
    zle -C alias-expension complete-word _generic
    bindkey '^Xa' alias-expension
    zstyle ':completion:alias-expension:*' completer _expand_alias
    zstyle ':completion:*' menu yes
    zstyle ':completion:*' complete-options true
    zstyle ':completion:*:*:*:*:corrections' format '%F{yellow}!- %d (errors: %e) -!%f'
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
          compdef _files nvim
          compdef _files cat
        '';

        zshConfig = ''
          [[ -f ~/zsh/.p10k.zsh ]] && source ~/zsh/.p10k.zsh
        '';
      in
        lib.mkMerge [ zshEarlyInit zshCompInit zshConfig ];
  };
  };
              }
