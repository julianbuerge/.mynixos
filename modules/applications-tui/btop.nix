{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    btop #task manager
  ];
}
