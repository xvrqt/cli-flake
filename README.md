# CLI Flake
This flake is a collection of many different CLI programs, and shell customizations. I have a strong bias to using programs written in Rust, and to use modern rewrites of programs. 

- [Shells](https://github.com/xvrqt/cli-flake/tree/master/shells) - Configurations for BASH, ZSH, and NuShell
- [Core Utilities](https://github.com/xvrqt/cli-flake/tree/master/coreUtils) - Common CLI system administration tools
- More coming...

# Usage
This flake can be used as either a NixOS Module or a Home-Manager Module (or both). Simply add the flake to your inputs, and add the default module to the your NixOS/Home Configuration.
**This will enable and configure everything by default.** Continue reading to learn how to customize your configuration.

## NixOS Installation
```nix
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    # Add the CLI flake :]
    cli.url = "github:xvrqt/cli-flake";
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

## Home-Manager Installation
```nix
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Add the CLI flake :]
    cli.url = "github:xvrqt/cli-flake";
  };
  
  outputs = { nixpkgs, home-manager, cli, ... }: let
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
## Customization
Sometimes you have limited resources, bad taste, or a sensible fear of cluttering your `$PATH` - whichever the case, here's how you can disable different categories of programs from being installed and configured.
```nix
  # This works on both the NixOS and Home-Manager Modules
  cli = {
    coreUtils.enable = false;
  };

```
You can typically disable a program by setting `program.${program}.enable = false` and the similarily override any configuration;
NOTE: If you want further customization, see each sub-mnodule.

-----
![Woman works on a computer](https://github.com/xvrqt/cli-flake/blob/dev/patron.png?raw=true "Patron Saint")
P.S. I Love You

