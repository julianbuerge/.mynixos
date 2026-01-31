{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    home-manager #declarative dot file management
  ];
}
