{pkgs}:
pkgs.mkShell {
  packages = [
    (pkgs.python313.withPackages (pypkgs:
      with pypkgs; [
        numba
        numpy
        pillow
      ]))
  ];
}
