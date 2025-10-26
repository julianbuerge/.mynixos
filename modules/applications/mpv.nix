{
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    mpv #media player, audio, pictures and videos
  ];

  #this may cause trouble on a different OS, but I don't want to put it into a different file either
  #maybe there could be an if/else check if we are on NixOS?
  xdg.mime.defaultApplications = {
    "image/png" = "mpvi.desktop";
    "image/jpeg" = "mpvi.desktop";
    "image/jpg" = "mpvi.desktop";
    "image/gif" = "mpvi.desktop";
  };
}
