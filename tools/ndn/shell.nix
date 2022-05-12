{
   system ? builtins.currentSystem
 , pkgs ? import <nixpkgs> { inherit system; }
}:
pkgs.mkShell {
  buildInputs = with pkgs; [
    pkgs.bazel_4
    pkgs.bazel-buildtools
    jdk11
    unixtools.util-linux
  ];
  shellHook = ''
    echo "startup --output_base $(readlink -f ./bazel-output)" > "$(pwd)"/.output-bazelrc
  '';
}
