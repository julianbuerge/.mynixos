#these options will modify fstab.
{ config, ... }:

{
    #mount my data drive
    fileSystems."/Data" = {

	device = "/dev/disk/by-uuid/b2c7a814-a946-4e20-aa63-4f23d1b06a25";
	fsType = "ext4";
	options = [ "nofail" "defaults" ];

    };
    #mount my backup & games drive
    fileSystems."/Data2" = {

	device = "/dev/disk/by-uuid/a05c41da-9ff8-45c1-91d4-a251ef0653d0";
	fsType = "ext4";
	options = [ "nofail" "defaults" ];

    };


}
