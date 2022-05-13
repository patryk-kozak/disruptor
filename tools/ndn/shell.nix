{
   system ? builtins.currentSystem
 , pkgs ? import <nixpkgs> { inherit system; }
}:
pkgs.mkShell rec {
  buildInputs = with pkgs; [
    pkgs.bazel_4
    pkgs.bazel-buildtools
    jdk11
    unixtools.util-linux
    llvmPackages_latest.bintools
    llvmPackages_latest.llvm
    rustup
  ];

  RUSTC_VERSION = pkgs.lib.readFile ./rust-toolchain;
  LIBCLANG_PATH= pkgs.lib.makeLibraryPath [ pkgs.llvmPackages_latest.libclang.lib ];

  shellHook = ''
    export PATH=$PATH:~/.cargo/bin
    export PATH=$PATH:~/.rustup/toolchains/$RUSTC_VERSION-x86_64-unknown-linux-gnu/bin/
    echo "startup --output_base $(readlink -f ./bazel-output)" > "$(pwd)"/.output-bazelrc
  '';
}
