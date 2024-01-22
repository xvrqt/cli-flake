# NixOS CLI Utlities
This flake provides both NixOS and Home-Manager modules to install common CLI programsm, and preconfigures them as a crow would.
You can choose to use the NixOS Module, or the Home-Manager Module, or both. I recommend using the `coreUtils` and `shells` as both a NixOS and Home-Manager Module, so that useful system tools and shell environments are installed for all users; for everything else, use the Home-Manager Module as it will often be configured better than the NixOS Module.

## Usage
### NixOS Installation 
First add the repo as an input to your flake, and then add the module to your NixOS configuration.
```nix
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    # Add the CLI flake :]
    coreUtils.url = "github:xvrqt/cli-flake";
  };
  
  outputs = { nixpkgs, cli, ... }: let
    mkSystem = nixpkgs.lib.nixosSystem;
    pkgs = import nixpkgs {
      system = "x86_64-linux";
      config.allowUnfree = true;
    };

    nixosConfigurations.myComputer =  mkSystem {
      inherit pkgs;
        modules = [
          cli.nixosModules.default # <--- This is the important bit
          configuraiton.nix
       ];
    };
  };
}
```
Then you can enable the configurations in your `configuration.nix`
All programs listed are enabled by default, but can be individually disabled by setting `cli.${submodule}.enable = false`. 
The example below disables the `coreUtils` module from being added to your options and installed by default.
```nix
{ 
  # ...
  modules = [
    cli.nixosModules.default {
      coreUtils.enable = false;
    }
    configuraiton.nix
  ];
}
```
### Home-Manager Installation
First add the repo as an input to your flake, and then add the module to your Home-Manager configuration.
```nix
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Add the coreUtils flake :]
    cli.url = "github:xvrqt/cli-flake";
  };
  
  outputs = { nixpkgs, home-manager, coreUtils, ... }: let
    mkHome = home-manager.lib.homeManagerConfiguration;
    pkgs = import nixpkgs {
      system = "x86_64-linux";
      config.allowUnfree = true;
    };

    homeConfiguration = mkHome {
      inherit pkgs;
        modules = [
        cli.homemanagerModules.default # <-- This is the important bit
        home.nix
       ];
    };
  };
}
```

Then you can enable the configurations in your `home.nix`
All programs listed are enabled by default, but can be individually disabled by setting `cli.${submodule}.enable = false`. 
The example below disables the `coreUtils` module from being added to your options and installed by default.
```nix
{ 
  # ...
  modules = [
    cli.nixosModules.default {
      coreUtils.enable = false;
    }
    configuraiton.nix
  ];
}
```

-----
![Woman works on a computer](https://github.com/xvrqt/cli-flake/blob/dev/patron.png?raw=true "Patron Saint")
P.S. I Love You
