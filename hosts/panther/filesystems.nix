#these options will modify fstab.
{ config, ... }:

{
    #mount my data drive
    fileSystems."/Data" = {

	device = "/dev/disk/by-uuid/b2c7a814-a946-4e20-aa63-4f23d1b06a25";
	fsType = "ext4";
	options = [ "nofail" "defaults" ];

    };

}
