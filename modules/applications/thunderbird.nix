{
  config,
  pkgs,
  ...
}: {
  programs.thunderbird = {
    enable = true;

    policies = {
      # Disable telemetry, startup pages, etc.
      DisableTelemetry = true;
      DisableSetAsDefaultClient = true;
      DisableDefaultClientAgent = true;

      # You can install extensions declaratively here if you want:
      ExtensionSettings = {
        "DuctTape-Dark@addons.thunderbird.net" = {
          installation_mode = "force_installed";
          install_url = "https://addons.thunderbird.net/thunderbird/downloads/latest/dark-black-theme/addon-988343-latest.xpi?src=dp-btn-primary";
        };
      };
    };

    # Preferences = user.js style (about:config keys)
    preferences = {
      "mailnews.message_display.disable_remote_image" = true;

      "network.cookie.cookieBehavior" = 2; # 0=accept all, 1=only from origin, 2=block all

      "mailnews.start_page.enabled" = false;
      "mailnews.start_page.override_url" = "";
      "mailnews.start_page.url" = "";

      "mail.shell.checkDefaultClient" = false;

      "mailnews.default_news_sort_order" = 2; # 2=by date
      "mailnews.default_news_view_flags" = 1; # 1=threaded, 0=flat
      "mailnews.default_sort_order" = 2;
      "mailnews.default_view_flags" = 1; # 1=threaded view
      # If you want *strictly* table/flat view:
      # "mailnews.default_view_flags" = 0;

      # Dark mode (TB >= 91 uses system dark theme; force pref anyway)
      "ui.systemUsesDarkTheme" = 1;
    };

    # Optional: enforce preferences (users can’t change them in GUI)
    preferencesStatus = "user"; # or "default" / "user"
  };
}
