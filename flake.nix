{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    { nixpkgs
    , flake-utils
    , ...
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        lib = pkgs.lib;
        pkgs = import nixpkgs { inherit system; };
      in
      {
        nixosModules = {
          # Full config support of available shells
          default = import ./nixosModule.nix { inherit pkgs lib; };
        };

        homeManagerModules = {
          # Full config support of available shells
          default = import ./homeManagerModule.nix { inherit pkgs lib; };
        };
      }
    );
}
