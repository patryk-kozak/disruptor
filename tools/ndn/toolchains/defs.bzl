load("@io_tweag_rules_nixpkgs//nixpkgs:nixpkgs.bzl", "nixpkgs_git_repository")
load("@io_tweag_rules_nixpkgs//nixpkgs:nixpkgs.bzl", "nixpkgs_cc_configure")
load("@io_tweag_rules_nixpkgs//nixpkgs:nixpkgs.bzl", "nixpkgs_rust_configure")
load("@rules_rust//rust:repositories.bzl", "rust_repositories")

def nixpkgs():
    nixpkgs_git_repository(
        name = "nixpkgs",
        revision = "21.11",
        sha256 = "c77bb41cf5dd82f4718fa789d49363f512bb6fa6bc25f8d60902fe2d698ed7cc",
    )

def cc_toolchain():

    nixpkgs_cc_configure(
        name = "nixpkgs_config_cc",
        repository = "@nixpkgs",
    )

def rust_toolchain():

    nixpkgs_rust_configure(
        repository = "@nixpkgs//:default.nix",
        name = "nix_rust",
    )

    rust_repositories()