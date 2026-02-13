{pkgs}:
pkgs.mkShell {
  packages = [
    (pkgs.python313.withPackages (pypkgs:
      with pypkgs; [
        jax
        equinox
        optax
        numpy
        matplotlib
        jupyterlab
        pandas
        torch
      ]))
  ];
}
