{
  config,
  pkgs,
  variables,
  ...
}: let
  inherit (variables) hostname username;
in {
  programs.niri.enable = true;

  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-gnome
    ];
  };

  environment.systemPackages = with pkgs; [
    waybar
    wofi
    swww
    mako
    wl-clipboard
  ];

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };
}
