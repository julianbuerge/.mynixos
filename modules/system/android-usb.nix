{ config, pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        jmtpfs #fuse file system support
        simple-mtpfs #communication with an android device through usb
    ];

    #HOW TO:

    #Plug in the phone, have the screen unlocked. Do
    #simple-mtpfs mountpoint
    #where mounpoint is any directory of choice on the PC.
    #On the phone screen it will ask for permission. Click allow. The mount will fail.
    #Do it again, this time it will work since the phone now has given permission
    #To unmount do
    #fusermount -u mountpoint
}
