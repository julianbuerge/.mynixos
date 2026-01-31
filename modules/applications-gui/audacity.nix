{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    audacity #audio editor
  ];
}
