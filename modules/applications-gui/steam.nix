{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    steam #gaming client
  ];
}
