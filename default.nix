{ pkgs ? import <nixpkgs> {} }:

with pkgs;
let
  gems = bundlerEnv {
    name = "os-seminar-gems";
    inherit ruby;
    gemdir = ./.;
  };

in stdenv.mkDerivation {
  name = "os-seminar-web";
  nativeBuildInputs = [ gems ruby nodejs ];
  builder = writeText "builder.sh" ''
    source ${stdenv}/setup
    mkdir -p $out
    LC_CTYPE=C.UTF-8 JEKYLL_ENV=production jekyll build --source $src --destination $out --safe
    '';
  src = ./.;
}
