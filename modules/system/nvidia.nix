{
  config,
  pkgs_nvidia,
  ...
}: {
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia = {
    modesetting.enable = true;
    open = false;
    nvidiaSettings = true;
    package =
      (pkgs_nvidia.linuxPackagesFor config.boot.kernelPackages.kernel)
      .nvidiaPackages.stable;
  };
}
