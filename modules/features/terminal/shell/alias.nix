let
  myAliases = {
    n = "nvim";
    cd = "z";
    ".." = "cd ..";
    "..." = "cd ../..";
    "...." = "cd ../../..";
    ls = "eza --icons";
    ll = "eza -lah --icons --git";
    lt = "eza --tree --icons";
    lta = "eza --tree --icons -a";
    cat = "bat";
    cp = "cp -iv";
    mv = "mv -iv";
    rm = "rm -ivfr";
    mkdir = "mkdir -pv";
    nr = "nh os switch -H nixos";
    nu = "nh os switch -H nixos --update -v";
    nc = "nh clean all --keep 3";
  };
in
{
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
