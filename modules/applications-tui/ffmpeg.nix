{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    ffmpeg #video and image handling library
    ffmpegthumbnailer # creates picture/video thumbnails
  ];
}
