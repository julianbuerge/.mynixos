{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    appimage-run #allows running app images
  ];
}
