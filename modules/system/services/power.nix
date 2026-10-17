{
  flake.modules.nixos.power = {
    services = {
      logind.settings.Login = {
        HandlePowerKey = "suspend";
        HandleLidSwitch = "ignore"; # Let hyprland take care of it
      };
      power-profiles-daemon.enable = true;
      upower.enable = true;
    };
  };
}
