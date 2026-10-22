{ inputs, ... }:
{
  flake-file.inputs.hyprland.url = "github:hyprwm/Hyprland";

  flake.modules = {
    nixos.hyprland = { pkgs, ... }: {
      home-manager.sharedModules = [ inputs.self.modules.homeManager.hyprland ];
      programs.hyprland = {
        enable = true;
        package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
        portalPackage =
          inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
      };
      environment.systemPackages = [ pkgs.hyprshot ];
    };
    homeManager.hyprland = {
      wayland.windowManager.hyprland = {
        enable = true;
        xwayland.enable = true;
        configType = "lua";
        package = null;
        portalPackage = null;
        extraLuaFiles = {
          "config.animation" = {
            autoLoad = true;
            content = ./hypr/config/animations.lua;
          };
          "config.decoration" = {
            autoLoad = true;
            content = ./hypr/config/decoration.lua;
          };
          "config.env" = {
            autoLoad = true;
            content = ./hypr/config/env.lua;
          };
          "config.execs" = {
            autoLoad = true;
            content = ./hypr/config/execs.lua;
          };
          "config.general" = {
            autoLoad = true;
            content = ./hypr/config/general.lua;
          };
          "config.gestures" = {
            autoLoad = true;
            content = ./hypr/config/gestures.lua;
          };
          "config.group" = {
            autoLoad = true;
            content = ./hypr/config/group.lua;
          };
          "config.input" = {
            autoLoad = true;
            content = ./hypr/config/input.lua;
          };
          "config.keybinds" = {
            autoLoad = true;
            content = ./hypr/config/keybinds.lua;
          };
          "config.misc" = {
            autoLoad = true;
            content = ./hypr/config/misc.lua;
          };
          "config.rules" = {
            autoLoad = true;
            content = ./hypr/config/rules.lua;
          };
          "scheme.default" = {
            autoLoad = false;
            content = ./hypr/scheme/default.lua;
          };
          "utils.functions" = {
            autoLoad = false;
            content = ./hypr/utils/functions.lua;
          };
          "utils.json" = {
            autoLoad = false;
            content = ./hypr/utils/json.lua;
          };
          "variables" = {
            autoLoad = false;
            content = ./hypr/variables.lua;
          };
        };
      };
    };
  };
}
