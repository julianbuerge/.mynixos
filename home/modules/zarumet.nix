{
  programs.zarumet = {
    enable = true;

    settings = {
      mpd = {
        address = "localhost:6600";
      };
      pipewire = {
        bit_perfect_enabled = true;
      };
    };
  };
}
