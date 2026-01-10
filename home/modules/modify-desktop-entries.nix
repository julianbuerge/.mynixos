{
  config,
  pkgs,
  ...
}: {
  home.file = {
    ".local/share/applications/zarumet.desktop".text = ''
      [Desktop Entry]
      Name=Zarumet
      Comment=Client for mpd
      Exec=kitty zarumet
      Icon=music
      Terminal=false
      Type=Application
      Categories=Music;Media;Mpd;
    '';

    #hide or modify desktop entries that we don't want to launch graphically
    #by adding a user .desktop entry with NoDisplay=true.
    #user entries take precedence over the system wide ones.
    ".local/share/applications/btop.desktop".text = ''
      [Desktop Entry]
      Name=Btop
      NoDisplay=true
      Type=Application
      Exec=btop
    '';
    ".local/share/applications/julia.desktop".text = ''
      [Desktop Entry]
      Name=Julia
      NoDisplay=true
      Type=Application
      Exec=julia
    '';

    ".local/share/applications/pcmanfm-desktop-pref.desktop".text = ''
      [Desktop Entry]
      Name=Desktop-Preferences
      NoDisplay=true
      Type=Application
      Exec=pcmanfm --desktop-pref
    '';

    ".local/share/applications/pcmanfm.desktop".text = ''
      [Desktop Entry]
      Type=Application
      Icon=file-manager
      Name=Pcmanfm
      Categories=GTK;System;Core;FileTools;FileManager;
      Exec=pcmanfm %U
      StartupNotify=true
      Terminal=false
      MimeType=inode/directory;
    '';
    ".local/share/applications/nvim.desktop".text = ''
      [Desktop Entry]
      Name=Neovim
      NoDisplay=true
      Type=Application
      Exec=nvim
    '';
    ".local/share/applications/org.gnome.World.Secrets.desktop".text = ''
      [Desktop Entry]
      Name=Secrets
      Comment=A password manager for GNOME
             Icon=org.gnome.World.Secrets
             Exec=secrets %F
             Terminal=false
             Type=Application
             Categories=Utility;GTK;GNOME;
             MimeType=application/x-keepass2;
             Keywords=keepass;encrypt;secure;
             X-Purism-FormFactor=Workstation;Mobile;
    '';

    ".local/share/applications/steam.desktop".text = ''
      [Desktop Entry]
      Name=Steam
      Comment=Application for managing and playing games on Steam
      Exec=steam %U
      Icon=steam
      Terminal=false
      Type=Application
      Categories=Network;FileTransfer;Game;
      MimeType=x-scheme-handler/steam;x-scheme-handler/steamlink;
      PrefersNonDefaultGPU=true
    '';

    ".local/share/applications/firefox.desktop".text = ''
      [Desktop Entry]
      Categories=Network;WebBrowser
      Exec=firefox --name firefox %U
      GenericName=Web Browser
      Icon=firefox
      MimeType=text/html;text/xml;application/xhtml+xml;application/vnd.mozilla.xul+xml;x-scheme-handler/http;x-scheme-handler/https
      Name=Firefox
      StartupNotify=true
      StartupWMClass=firefox
      Terminal=false
      Type=Application
    '';
    ".local/share/applications/thunderbird.desktop".text = ''
      [Desktop Entry]
      Categories=Network;Chat;Email;Feed;GTK;News
      Comment=Read and write e-mails or RSS feeds, or manage tasks on calendars.
      Exec=thunderbird --name thunderbird %U
      GenericName=Email Client
      Icon=thunderbird
      Keywords=mail;email;e-mail;messages;rss;calendar;address book;addressbook;chat
      MimeType=message/rfc822;x-scheme-handler/mailto;text/calendar;text/x-vcard
      Name=Thunderbird
      StartupNotify=true
      StartupWMClass=thunderbird
      Terminal=false
      Type=Application
    '';
    ".local/share/applications/gimp.desktop".text = ''
      [Desktop Entry]
      Type=Application
      Name=GIMP
      Keywords=GIMP;graphic;design;illustration;painting;
      Exec=gimp-3.0 %U
      TryExec=gimp-3.0
             Icon=gimp
      Terminal=false
      Categories=Graphics;2DGraphics;RasterGraphics;GTK;
      StartupNotify=true
      MimeType=image/bmp;image/g3fax;image/svg+xml;image/x-compressed-xcf;image/x-fits;image/x-gimp-gbr;image/x-gimp-gih;image/x-gimp-pat;image/x-pcx;image/x-portable-anymap;image/x-portable-bitmap;image/x-portable-graymap;image/x-portable-pixmap;image/x-psd;image/x-sgi;image/x-sun-raster;image/x-tga;image/x-xbitmap;image/x-xcf;image/x-xwindowdump;image/tiff;image/x-psp;application/postscript;image/x-icon;image/x-xpixmap;image/x-ilbm;image/x-exr;image/x-webp;image/webp;image/heif;image/heic;image/avif;image/x-wmf;image/jp2;image/jpeg2000;image/jpx;image/jxl;image/x-xcursor;image/fits;image/openraster
      StartupWMClass=gimp-3.0
    '';
    ".local/share/applications/mpvi.desktop".text = ''
      [Desktop Entry]
      Type=Application
      Name=mpv Image Viewer
      Icon=mpv
      TryExec=mpv
      NoDisplay=true
      Exec=mpv --image-display-duration=inf %U
      Terminal=false
      StartupWMClass=mpv
      Keywords=mpv;media;player;image;picture;
      MimeType=image/png;image/jpeg;image/gif;
    '';
    ".local/share/applications/yazi.desktop".text = ''
      [Desktop Entry]
      Type=Application
      Name=Yazi
      Icon=yazi
      Comment=Blazing fast terminal file manager written in Rust, based on async I/O
      Terminal=false
      TryExec=yazi
      Exec=kitty yazi %u
      Type=Application
      MimeType=inode/directory
      Categories=Utility;Core;System;FileTools;FileManager;ConsoleOnly
      Keywords=File;Manager;Explorer;Browser;Launcher
    '';
  };
}
