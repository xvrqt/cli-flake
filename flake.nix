{
  outputs = { ... }: {
    nixosModules.default = { lib, pkgs, ... }: {
      # Full config support of available shells
      imports = [ (import ./nixosModule.nix { inherit pkgs lib; }) ];
    };

    homeManagerModules.default = { lib, pkgs, ... }: {
      # Full config support of available shells
      imports = [ (import ./homeManagerModule.nix { inherit pkgs lib; }) ];
    };
  };
}
