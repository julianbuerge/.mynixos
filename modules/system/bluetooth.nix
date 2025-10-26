{
  config,
  pkgs,
  ...
}: {
  #TO USE:
  #Do 'bluetoothctl'
  #enable with 'power on'
  #start searching devices with 'scan on'
  #you can pair, connect and trust devices by doing 'pair hexaddress'
  #if a device is already paired find it with 'devices'. Then you'll see its hexaddress and can connect it.

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = false;

    settings = {
      General = {
        Experimental = true;
        FastConnectable = true;
      };
      Policy = {
        AutoEnable = true;
      };
    };
  };
}
