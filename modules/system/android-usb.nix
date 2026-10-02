{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    android-tools # contains adb
  ];
}
