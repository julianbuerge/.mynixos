/*
copied from https://discourse.nixos.org/t/declare-firefox-extensions-and-settings/36265
*/
{...}: let
  lock-false = {
    Value = false;
    Status = "locked";
  };
  lock-true = {
    Value = true;
    Status = "locked";
  };
in {
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
  };

  programs = {
    firefox = {
      enable = true;
      languagePacks = ["en-US" "es-MX" "de"];

      #needed for screen sharing in wayland (says the wiki)
      wrapperConfig = {
        pipewireSupport = true;
      };

      /*
      ---- POLICIES ----
      */
      policies = {
        DontCheckDefaultBrowser = true;
        DisableTelemetry = true;
        DisableFirefoxStudies = true;
        EnableTrackingProtection = {
          Value = true;
          Locked = true;
          Cryptomining = true;
          Fingerprinting = true;
        };
        DisablePocket = true;
        DisableFirefoxAccounts = true;
        DisableAccounts = true;
        DisableFirefoxScreenshots = true;
        OfferToSaveLogins = false;
        PasswordManagerEnabled = false;
        SanitizeOnShutdown = true;
        AutofillAddressEnabled = false;
        AutofillCreditCardEnabled = false;
        DisableFormHistory = true;

        OverrideFirstRunPage = "";
        OverridePostUpdatePage = "";
        SearchBar = "unified"; # alternatives: "unified", "separate"
        FirefoxHome = {
          Search = true;
          TopSites = false;
          SponsoredTopSites = false;
          Highlights = false;
          Pocket = false;
          SponsoredPocket = false;
          Snipptes = false;
          Locked = true;
        };
        Homepage = {
          Locked = true;
          StartPage = "none"; #alternative is "homepage" and some others I think
        };
        NewTabPage = false;

        SearchEngines = {
          Default = "DuckDuckGo";
          Remove = [
            "Google"
            "Bing"
            "Ecosia"
            "eBay"
          ];
          PreventInstalls = true;
        };
        SearchSuggestEnabled = false;
        FirefoxSuggest = {
          WebSuggestions = false;
          SponsoredSuggestions = false;
          ImproveSuggest = false;
          Locked = true;
        };

        DisplayBookmarksToolbar = "always"; # alternatives: "always" or "newtab"
        DisplayMenuBar = "never"; # alternatives: "always", "never" or "default-on"

        /*
        ---- EXTENSIONS ----
        */
        # Valid strings for installation_mode are "allowed", "blocked", "force_installed" and "normal_installed".
        ExtensionSettings = {
          "*".installation_mode = "allowed"; # blocks all addons except the ones specified below
          "*".allowed_type = ["extension" "theme" "dictonary" "locale"];
          # uBlock Origin:
          "uBlock0@raymondhill.net" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
            installation_mode = "force_installed";
            private_browsing = true;
          };
          #Vim motions
          "tridactyl.vim@cmcaine.co.uk" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/file/4549492/tridactyl_vim-1.24.4.xpi";
            installation_mode = "force_installed";
            private_browsing = true;
          };
          #Theme
          "YetAnotherAMOLEDTheme@neopolitan.uk" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/file/4013174/yet_another_amoled_theme-1.0.xpi";
            installation_mode = "force_installed";
            private_browsing = true;
          };
        };

        /*
        ---- PREFERENCES ----
        */
        Preferences = {
          "browser.contentblocking.category" = {
            Value = "strict";
            Status = "locked";
          };
          "privacy.globalprivacycontrol.enabled" = lock-true;

          "extensions.pocket.enabled" = lock-false;
          "extensions.screenshots.disabled" = lock-true;

          "browser.topsites.contile.enabled" = lock-false;
          "browser.formfill.enable" = lock-false;

          "browser.search.suggest.enabled" = lock-false;
          "browser.search.suggest.enabled.private" = lock-false;

          "browser.urlbar.suggest.searches" = lock-false;
          "browser.urlbar.showSearchSuggestionsFirst" = lock-false;
          "browser.urlbar.restrict.bookmark" = lock-true;
          "browser.urlbar.quickactions.enabled" = lock-false;
          "browser.urlbar.shortcuts.bookmarks" = lock-true;
          "browser.urlbar.shortcuts.history" = lock-false;
          "browser.urlbar.shortcuts.tabs" = lock-false;
          "browser.urlbar.suggest.addons" = lock-false;
          "browser.urlbar.suggest.recentsearches" = lock-false;
          "browser.urlbar.suggest.wikipedia" = lock-false;
          "services.sync.prefs.sync.browser.urlbar.suggest.topsites" = false;
          "services.sync.prefs.sync.browser.urlbar.suggest.searches" = false;
          "services.sync.prefs.sync.browser.urlbar.suggest.histroy" = false;
          "services.sync.prefs.sync.browser.urlbar.suggest.openpage" = false;
          "services.sync.prefs.sync.browser.urlbar.suggest.engines" = false;

          "browser.newtabpage.enabled" = lock-false;
          "browser.newtabpage.activity-stream.feeds.section.topstories" = lock-false;
          "browser.newtabpage.activity-stream.feeds.snippets" = lock-false;
          "browser.newtabpage.activity-stream.section.highlights.includePocket" = lock-false;
          "browser.newtabpage.activity-stream.section.highlights.includeBookmarks" = lock-false;
          "browser.newtabpage.activity-stream.section.highlights.includeDownloads" = lock-false;
          "browser.newtabpage.activity-stream.section.highlights.includeVisited" = lock-false;
          "browser.newtabpage.activity-stream.showSponsored" = lock-false;
          "browser.newtabpage.activity-stream.system.showSponsored" = lock-false;
          "browser.newtabpage.activity-stream.showSponsoredTopSites" = lock-false;

          "browser.translations.automaticallyPopup" = lock-false;

          "browser.display.background_color.dark" = "#000000";
          "browser.display.background_color" = "#000000";
          "browser.theme.content-theme" = 0; #0 is dark, 1 light, 2 system, 3 toolbar
          "devtools.toolbox.zoomValue" = 1.33;
        };
      };
    };
  };
}
