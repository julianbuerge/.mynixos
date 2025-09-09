{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
	gcc
	clang
	gdb
	cmake
	gnumake
	ninja
	python3Full
	texliveFull
	lua
	julia
	conda
 ];

}

