# NixOS Shells
This flake provides both NixOS and Home-Manager modules that preconfigure the following shells:
- [ZSH](https://www.zsh.org/)
- [BASH](https://www.gnu.org/software/bash/)

Things like auto-complete, nice themes, sane config, history, and other defaults.

## Usage
Add the default module to _either_ your NixOS configuration modules list, **or** your Home-Manager configuration modules list.
### NixOS Installation
First add the repo as an input to your flake, and then add the moudle to your Home-Manager configuration.
```nix
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Add your shells flake :]
    shells.url = "github:xvrqt/shells-flake";
  };
  
  outputs = { nixpkgs, home-manager, shells, ... }: let
    mkHome = home-manager.lib.homeManagerConfiguration;
    pkgs = import nixpkgs {
      system = "x86_64-linux";
      config.allowUnfree = true;
    };

    homeConfiguration = mkHome {
      inherit pkgs;
        modules = [
        shells.homemanagerModules.default
        home.nix
       ];
    };
  };
}
```
Then you can enable the configurations in your `configuraiton.nix`
```nix
{
  programs = {
    zsh = {
      enable = true;
      crowConfig = true; # This configures the shell as a crow would.
    };
    bash = {
      enable = true;
      crowConfig = true; # This configures the shell as a crow would.
    };
  };
}
```

### Home-Manager Installation
First add the repo as an input to your flake, and then add the moudle to your Home-Manager configuration.
```nix
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Add your shells flake :]
    shells.url = "github:xvrqt/shells-flake";
  };
  
  outputs = { nixpkgs, home-manager, shells, ... }: let
    mkHome = home-manager.lib.homeManagerConfiguration;
    pkgs = import nixpkgs {
      system = "x86_64-linux";
      config.allowUnfree = true;
    };

    homeConfiguration = mkHome {
      inherit pkgs;
        modules = [
        shells.homemanagerModules.default
        home.nix
       ];
    };
  };
}
```
Then you can enable the configurations in your `home.nix`
```nix
{
  home = { ... };
  programs = {
    zsh = {
      enable = true;
      crowConfig = true; # This configures the shell as a crow would.
    };
    bash = {
      enable = true;
      crowConfig = true; # This configures the shell as a crow would.
    };
  };
}
```

P.S. I Love You
