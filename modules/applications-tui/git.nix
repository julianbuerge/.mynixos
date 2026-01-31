{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    git #source control system
  ];
}
