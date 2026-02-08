{pkgs, ...}: {
  programs.mango.enable = true;

  #RealtimeKit system service, which hands out realtime scheduling priority to user processes on demand, which pipewire uses to acquire realtime priority.
  security.rtkit.enable = true;

  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-wlr #wiki says this is needed for screen sharing in firefox
    ];
  };

  environment.systemPackages = with pkgs; [
    mpvpaper
    mako
    grim #wayland screenshots
    slurp #wayland screenshots
    wl-clipboard
    wl-clip-persist
  ];
}
