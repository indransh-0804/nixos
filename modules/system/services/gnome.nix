{self, inputs, ...}:{
flake.nixosModules.gnome = { pkgs, ... }:
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
