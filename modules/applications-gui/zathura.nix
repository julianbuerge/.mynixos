{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    zathura
  ];

  #this may cause trouble on a different OS, but I don't want to put it into a different file either
  #maybe there could be an if/else check if we are on NixOS?
  xdg.mime.defaultApplications = {
    "application/pdf" = "org.pwmt.zathura.desktop";
  };
}
