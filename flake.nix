{
  description = "rust-rocksdb development shell";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs =
    { nixpkgs, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        hardeningDisable = [
          "fortify"
          "fortify3"
        ];

        packages = with pkgs; [
          clang
          llvmPackages.libclang
          pkg-config
          rustup
        ];

        LIBCLANG_PATH = "${pkgs.llvmPackages.libclang.lib}/lib";
      };
    };
}
