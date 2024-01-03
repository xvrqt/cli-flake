{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";

    # Powerful neovim package
    neovim.url = "./neovim";
  };

  outputs = {neovim, ...}: {
    # Imports a home-manager-module for neovim that can be included in home.nix modules []
    inherit neovim;
    # Home-Manager module that installs and configures many common cli programs
    home-manager-module = import ./cli.nix;
  };
}
