{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    yazi #terminal file manager
  ];
}
