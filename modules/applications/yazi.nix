{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    yazi #terminal file manager
    ffmpegthumbnailer # creates picture/video thumbnails
 ];

}
