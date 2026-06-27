{inputs, ...}:{
flake.nixosModules.packages = {
  config,
  pkgs,
  ...
}: {
  programs = {
    firefox.enable = true;
    zsh.enable = true;
    dconf.enable = true;
  };

  environment.systemPackages = with pkgs; [
  sops
  age
    wget
    wl-clipboard
    btop
    powertop
    exfatprogs
    btrfs-progs
    udisks2
    gvfs
    gnome.gvfs
    nemo-with-extensions
    xdg-user-dirs
    mpv
    brightnessctl
    pavucontrol
    playerctl
    bluez
    blueman
  ];
};
}
