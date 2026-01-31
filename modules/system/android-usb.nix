{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    jmtpfs #fuse file system support
    simple-mtpfs #communication with an android device through usb
  ];
}
