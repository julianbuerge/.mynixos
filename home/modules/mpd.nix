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
      auto_update_depth "4"
      follow_outside_symlinks "yes"
      follow_inside_symlinks "yes"

      restore_paused "yes"

      metadata_to_use "artist,albumartist,album,title,track,name,genre,date,composer,performer,disc"
    '';
  };
}
