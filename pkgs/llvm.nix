{ pkgs, stdenv, targetPlatform }:
let
  gccForLibs = stdenv.cc.cc;
in
  stdenv.mkDerivation {
    name = "ddln-llvm-17";
    nativeBuildInputs = with pkgs; [
      python3
      ninja
      cmake
    ];

    src = builtins.fetchGit {
      url = "https://gitea.daedalean.ai/daedalean-github/llvm-project.git";
      rev = "99c3ef8b067aee83ca36fb4bd0cc37f8fdeb31d1";
    };

    cmakeDir = "../llvm";

    # where to find libgcc
    NIX_LDFLAGS="-L${gccForLibs}/lib/gcc/${targetPlatform.config}/${gccForLibs.version}";

    # teach clang about C startup file locations
    CFLAGS="-B${gccForLibs}/lib/gcc/${targetPlatform.config}/${gccForLibs.version} -B ${stdenv.cc.libc}/lib -Wno-error";

    cmakeFlags = [
      "-DGCC_INSTALL_PREFIX=${pkgs.gcc}"
      "-DC_INCLUDE_DIRS=${stdenv.cc.libc_dev}/include"
      "-GNinja"
      "-DLLVM_ENABLE_PROJECTS=clang-tools-extra"
      "-DLLVM_BUILD_RUNTIMES=OFF"
      "-DCMAKE_BUILD_TYPE=Release"
      "-DLLVM_TARGETS_TO_BUILD=X86;ARM;AArch64"
      "-DCMAKE_CXX_STANDARD=20"
    ];
  }
