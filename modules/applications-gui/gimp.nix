{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    gimp3 #image editor
  ];
}
