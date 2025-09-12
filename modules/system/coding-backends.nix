{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
	gcc
	clang
	gdb
	cmake
	gnumake
	ninja
	python314
	texliveFull
	lua
	julia
	conda
 ];

}

