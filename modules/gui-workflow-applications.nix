{ config, pkgs, ... }:

{
  imports = [
    ./firefox.nix
  ];

  environment.systemPackages = with pkgs; [
    keepassxc
    pcmanfm
    mpv #media player, audio, pictures and videos
    ffmpegthumbnailer # creates video thumbnails
    zathura
    thunderbird
    firefox
	
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
    

    "image/png" = "mpv.desktop";
    "image/jpeg" = "mpv.desktop";
    "image/gif" = "mpv.desktop";
    "image/bmp" = "mpv.desktop";
    "image/svg" = "mpv.desktop";

  };

}
