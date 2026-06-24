{ pkgs ? import <nixpkgs> {} }:
let
	pythonEnv = pkgs.python3.withPackages (p: with p; [
			appdirs
            argcomplete
            colorama
            dotty-dict
            hid
            hjson
            jsonschema
            milc
            pygments
            pyserial
            pyusb
            pillow
            nose2
            flake8
            pep8-naming
            pyflakes
            yapf
		]);
in
pkgs.mkShell {

    packages = ( with pkgs; [
        pythonEnv
        qmk
    ]);
    LD_LIBRARY_PATH="${builtins.getEnv("NIX_LD_LIBRARY_PATH")}:${pkgs.libxcb}/lib:${pkgs.libGL}/lib:${pkgs.glibc}/lib"; # provide libc++ to this shell env

}