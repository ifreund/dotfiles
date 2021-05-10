with import <nixpkgs> {};

llvmPackages_12.stdenv.mkDerivation rec {
  name = "zig-env";

  nativeBuildInputs = [ cmake ];
  buildInputs = [
    llvmPackages_12.clang-unwrapped
    llvmPackages_12.llvm
    llvmPackages_12.lld
    libxml2
  ];
}
