{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    dysk #disks viewing utility
  ];
}
