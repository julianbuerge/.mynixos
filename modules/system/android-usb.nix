{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    simple-mtpfs #communication with an android device through usb
  ];
}
