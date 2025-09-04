{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
	gcc
	clang
	gdb
	cmake
	ninja
	python3Full
	texliveFull
	lua
	julia
 ];

}

