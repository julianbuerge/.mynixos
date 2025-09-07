{ config, pkgs, ... }:

{
  imports = [
    ./firefox.nix
    ./thunderbird.nix
  ];

  environment.systemPackages = with pkgs; [
    gnome-secrets
    mpv #media player, audio, pictures and videos
    ffmpegthumbnailer # creates video thumbnails
    gimp3
    zathura
    thunderbird
    firefox
    hypnotix
    audacity
 ];

 xdg.mime.defaultApplications = {

    "x-scheme-handler/http" = "firefox.desktop";
    "x-scheme-handler/https" = "firefox.desktop";
    "x-scheme-handler/chrome" = "firefox.desktop";
    "text/html" = "firefox.desktop";
    "application/x-extension-htm" = "firefox.desktop";
    "application/x-extension-html" = "firefox.desktop";
    "application/x-extension-shtml" = "firefox.desktop";
    "application/xhtml+xml" = "firefox.desktop";
    "application/x-extension-xhtml" = "firefox.desktop";
    "application/x-extension-xht" = "firefox.desktop";

    "application/pdf" = "org.pwmt.zathura.desktop";

    "image/png" = "mpvi.desktop";
    "image/jpeg" = "mpvi.desktop";
    "image/jpg" = "mpvi.desktop";
    "image/gif" = "mpvi.desktop";
  };

}
