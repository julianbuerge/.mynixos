{
  pkgs,
  variables,
  ...
}: let
  inherit (variables) hostname username;
in {
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-wlr #wiki says this is needed for screen sharing in firefox
    ];
  };

  environment.systemPackages = with pkgs; [
    waybar
    wofi
    swww
    mpvpaper
    mako
    grim #wayland screenshots
    slurp #wayland screenshots
  ];

  environment.sessionVariables = {
    #this will be used in each rices hyprland.conf
    #to import the monitor configuration file for the right host
    #(rices are user specific, but the monitors are host specific)
    HYPRLAND_MONITORS_CONFIG_DIR = "/home/${username}/.mynixos/home/dotfiles/shared/hyprland/hosts/${hostname}/";
  };
}
