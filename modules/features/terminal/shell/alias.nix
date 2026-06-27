{ inputs, ... }:
let
  myAliases = {
    cd     = "z";
    cdi    = "zi";
    ".."   = "cd ..";
    "..."  = "cd ../..";
    "...." = "cd ../../..";
    ls     = "eza --icons";
    ll     = "eza -lah --icons --git";
    lt     = "eza --tree --icons --level=2";
    lta    = "eza --tree --icons --level=2 -a";
    cat    = "bat";
    cp     = "cp -iv";
    mv     = "mv -iv";
    rm     = "rm -iv";
    mkdir  = "mkdir -pv";
    nr     = "nh os switch -H nixos";
    nu     = "nh os switch -H nixos --update -v";
    nc     = "nh clean all --keep 3";
  };
in {
  flake.homeModules.zsh_shell = {
    programs.zsh = {
      shellAliases = myAliases;

      zsh-abbr = {
        enable = true;
        abbreviations = myAliases;
      };
    };
  };
}
