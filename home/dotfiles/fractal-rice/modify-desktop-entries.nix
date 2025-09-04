{ config, pkgs, ... }:

{
  home.file = {

    #hide or modify desktop entries that we don't want to launch graphically
    #by adding a user .desktop entry with NoDispaly=true.
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
    

  };

}
