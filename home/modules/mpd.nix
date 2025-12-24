{
  config,
  variables,
  ...
}: {
  services.mpd = {
    enable = true;

    musicDirectory = "/home/${variables.username}/MediaLibrary/Music";

    network = {
      listenAddress = "localhost";
      port = 6600;
    };
    extraConfig = ''
      audio_output {
        type "pipewire"
        name "Pipewire out"
      }
      auto_update "yes"
    '';
  };
}
