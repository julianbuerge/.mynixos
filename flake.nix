{
  description = "BaseFlake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs, ... }:

        let
        system = "x86_64-linux"; #should become part of variables.nix
        pkgs = import nixpkgs {
                                inherit system;
                                config.allowUnfree = true;
                              };

        #define a function that takes the hostname and sets up all the modules 
	setup = hostname : let 
                              variables = import ./hosts/${hostname}/variables.nix;
                           in 
                           nixpkgs.lib.nixosSystem {
		                modules = [
		                    ./hosts/${hostname}/host-configuration.nix
		                ];

                                                      #this get passed to the modules above
                           specialArgs = { inherit variables; };
	};

        in {

            #call the function for each available host
            nixosConfigurations = {
                xenia = setup "xenia";
                panther = setup "panther";
            };
            
            #at the moment these are hardcoded. we will make them modular per host later
            #if on a host they are never entered, they will not install their things
            #so that makes it kind of fine, though not so elegant.
            #we will also have to make python313 a variable
            devShells.${system} = {

                #this throws an error, saying
                #numba.cuda.cudadrv.error.NvvmSupportError: libNVVM cannot be found. Do `conda install cudatoolkit
                pynumba = pkgs.mkShell {
                            packages = [
                              pkgs.python313
                              pkgs.cudatoolkit
                              pkgs.python313Packages.numba
                              pkgs.python313Packages.numpy
                              pkgs.python313Packages.pillow
                            ];
                            env.LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath [
                                    pkgs.stdenv.cc.cc.lib
                                    pkgs.libz
                                    pkgs.cudaPackages.cudatoolkit
                            ] + ":/run/opengl-driver/lib";
                            shellHook = ''
                            echo "Welcome to numba"
                            '';

                };
                pyngf = pkgs.mkShell {
                                                               
                                packages = [
                                    pkgs.python313
                                    pkgs.cudaPackages.cudnn
                                    pkgs.cudaPackages.cudatoolkit
                                    pkgs.python313Packages.pyside6
                                    pkgs.python313Packages.pyqt6
                                ];

                                env = {
                                    LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath [
                                        pkgs.stdenv.cc.cc.lib
                                        pkgs.libz
                                        pkgs.cudaPackages.cudnn
                                        pkgs.cudaPackages.cudatoolkit
                                    ] + ":/run/opengl-driver/lib";
                                };

                                shellHook = ''
                                    python3 -m venv ~/.pyngfvenv
                                    source ~/.pyngfvenv/bin/activate
                                    pip install --upgrade pip
                                    pip install --upgrade "jax[cuda12]" equinox optax torch wandb scipy numpy matplotlib PySide6 PyQt6
                                '';
                        };
            };
  };
}
