{
  description = "A very basic rust bevy flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      devShells.${system}.default =
        pkgs.mkShell
          {
            nativeBuildInputs = with pkgs; [
              # pkgsconfig
              pkg-config
              clang
              lld
            ];
            buildInputs = with pkgs; [
              cargo
              rustc
              rustfmt
              pre-commit
              rustPackages.clippy
              alsa-lib
              udev
              #NOTE Add more deps
              vulkan-loader
              xorg.libX11
              # x11
              xorg.libXrandr
              xorg.libXcursor
              xorg.libXi
              libxkbcommon
              wayland
            ];

            shellHook = ''
              export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:${
                pkgs.lib.makeLibraryPath [
                  pkgs.udev
                  pkgs.alsaLib
                  pkgs.vulkan-loader
                  pkgs.libxkbcommon
                ]
              }"

              echo "Hello Mom"
              fish
            '';
          };
    };
}
