{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    playerctl #media controls
  ];
}
