{pkgs}:
pkgs.mkShell {
  packages = [
    (pkgs.python313.withPackages (pypkgs:
      with pypkgs; [
        jax
        jax-cuda12-plugin
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
