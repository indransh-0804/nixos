{self, inputs, ...}:{
flake.modules.nixos.gnome = { pkgs, ... }:
{
  services = {
    dbus.packages = with pkgs; [
      gcr
      gnome-settings-daemon
    ];

    gnome.gnome-keyring.enable = true;

    gvfs.enable = true;
  };
};
}
