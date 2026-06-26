{inputs, ...}:{
  flake.homeModules.zsh_shell = {config, ...}: {
home.file."zsh/.p10k.zsh".source = ./p10k.zsh;
};
}
