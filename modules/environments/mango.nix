{pkgs, ...}: {
  programs.mango.enable = true;

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
    wl-clipboard
    wl-clip-persist
  ];
}
