{
  inputs = {
    # The actual program lmao
    neovim.url = "github:NotAShelf/neovim-flake";
  };

  outputs = {neovim, ...}: {
    # Pass through the original flake for convenience
    inherit neovim;

    # Neovim pre-configured via home-manager module
    home-manager-module = import ./neovim-home-manager-module.nix;
  };
}
