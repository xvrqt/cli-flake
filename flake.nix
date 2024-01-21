{
  inputs = {
    # Live Dangerously, pin what works, rollback what doesn't
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
  };

  outputs = _: {
    nixosModules = {
      # Full config support of available shells
      default = import ./nixosModule.nix;
    };

    homeManagerModules = {
      # Full config support of available shells
      default = import ./homeManagerModule.nix;
    };
  };
}
