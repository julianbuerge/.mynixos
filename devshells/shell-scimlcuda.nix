{pkgs}:
pkgs.mkShell {
  packages = [
    (pkgs.python313.withPackages (pypkgs:
      with pypkgs; [
        jax
        jax-cuda12-plugin
        equinox
        optax
        torch
        scipy
        numpy
        matplotlib
        pyqt6
        pyside6
        wandb
      ]))
  ];
}
