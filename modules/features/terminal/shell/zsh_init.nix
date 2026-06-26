{inputs, ...}:{
  flake.homeModules.zsh_shell = {
{ lib, ... }: {
  programs.zsh = {
    initContent =
      let
        zshEarlyInit = lib.mkOrder 500 ''
          typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
          if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
            source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
          fi
        '';

        zshCompInit = lib.mkOrder 550 ''
          autoload -U compinit && compinit
          zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -lah --color=always $realpath'
          zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'eza -lah --color=always $realpath'
          zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
          zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
          zstyle ':completion:*' menu select
          zstyle ':fzf-tab:complete:*:*' fzf-preview '([[ -d "$realpath" ]] && eza -lah --color=always "$realpath") || bat --color=always "$realpath"'
          compdef _files nvim
          compdef _files cat
        '';

        zshConfig = lib.mkOrder 1000 ''
          eval "$(fzf --zsh)"
          eval "$(zoxide init zsh)"
          eval "$(direnv hook zsh)"
          [[ -f ~/.config/.p10k.zsh ]] && source ~/.config/.p10k.zsh
        '';
      in
        lib.mkMerge [ zshEarlyInit zshCompInit zshConfig ];
  };
}
              }
