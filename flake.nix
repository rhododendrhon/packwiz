{
  description = "A development shell for packwiz.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
  }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = nixpkgs.legacyPackages.${system};
      in {
        devShells.default = pkgs.mkShell {
          # nativeBuildInputs is for tools you run during build/dev
          nativeBuildInputs = with pkgs; [
            packwiz
          ];

          shellHook = ''
            echo "Modpack dev environment loaded!"
          '';
        };
      }
    );
}
