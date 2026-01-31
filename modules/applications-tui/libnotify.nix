{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    libnotify #notifications cli tool
  ];
}
