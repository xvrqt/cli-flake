# NixOS CLI Utlities
This flake provides both NixOS and Home-Manager modules to install common CLU system utilities. Like all categories, this one is both arbitrary and biased - and so this flake contains mostly utilities rewritten in Rust. These modules create entries under `programs = {}` for each of the utilities listed below, **and enables them by default**. For utilities that already have an entry under the `programs` configuration, this also **enables them by default**. If those entires have configuration options, it sets some sensible defaults. All of these programs can be disabled, or set with their own configurations in your own `configuration.nix` or `home.nix` which will take precedence over the configuration set by the modules.

Core-Utilities:
- [bandwhich](https://github.com/imsnif/bandwhich) - TUI network monitor
- [bat](https://github.com/sharkdp/bat) - `cat` replacement with wings
- [bingrep](https://github.com/m4b/bingrep) - search through binaries
- [bottom](https://github.com/ClementTsang/bottom) - a `top` replacement
- [croc](https://github.com/schollz/croc) - easily, securely send files
- [ddh](https://github.com/darakian/ddh) - duplicate file finder
- [delta](https://github.com/dandavison/delta) - a better `diff`
- [dtool](https://github.com/guoxbin/dtool) - convert between different text encodings
- [dust](https://github.com/bootandy/dust) - a better `du`
- [eza](https://github.com/eza-community/eza) - a better `ls`
- [fd](https://github.com/sharkdp/fd) - a better `find`
- [funzzy](https://github.com/cristianoliveira/funzzy) - fancy, fuzzy, file watcher
- [glow](https://github.com/charmbracelet/glow) - render Markdown in the terminal
- [grex](https://github.com/pemistahl/grex) - generate RegEx's from examples
- [hexyl](https://github.com/sharkdp/hexyl) - hex viewer
- [httm](https://github.com/kimono-koans/httm) - timemachine tool for `zfs`
- [httpie](https://github.com/httpie/cli) - a better `wget`/`curl`
- [hyperfine](https://github.com/sharkdp/hyperfine) - program benchmarking tool
- [jq](https://github.com/jqlang/jq) - JSON processor
- [kalker](https://github.com/PaddiM8/kalker) - calculator
- [kmon](https://github.com/orhun/kmon) - Linux kernel and activity monitor
- [mprocs](https://github.com/pvolok/mprocs) - run multiple processes and view their outputs
- [ouch](https://github.com/ouch-org/ouch) - (de)compression tool [rar,zip,gz,tar,7z,zst,sz,bz,xz]
- [procs](https://github.com/dalance/procs) - a better `ps`
- [pueue](https://github.com/Nukesor/pueue) - process execution management
- [ripgrep](https://github.com/BurntSushi/ripgrep) - a better `grep`
- [rm-improved](https://github.com/nivekuil/rip) - safe alternative to `rm`
- [sd](https://github.com/chmln/sd) - fast `sed `alternative
- [skim](https://github.com/lotabout/skim) - a fuzzy finder
- [systeroid](https://github.com/orhun/systeroid) - a better `sysctl(8)`
- [tealdeer](https://github.com/dbrgn/tealdeer) - fast `tldr` alternative
- [tokei](https://github.com/XAMPPRocky/tokei) - provides statistics about your code
- [trippy](https://github.com/fujiapple852/trippy) - TUI networking tool; a better `traceroute` and `ping`
- [zoxide](https://github.com/ajeetdsouza/zoxide/) - fast `cd` alternative that learns your habits

## Usage
### NixOS Installation 
First add the repo as an input to your flake, and then add the module to your NixOS configuration.
```nix
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    # Add the coreUtils flake :]
    coreUtils.url = "github:xvrqt/coreUtils-flake";
  };
  
  outputs = { nixpkgs, coreUtils, ... }: let
    mkSystem = nixpkgs.lib.nixosSystem;
    pkgs = import nixpkgs {
      system = "x86_64-linux";
      config.allowUnfree = true;
    };

    nixosConfigurations.myComputer =  mkSystem {
      inherit pkgs;
        modules = [
          coreUtils.nixosModules.default # <--- This is the important bit
          configuraiton.nix
       ];
    };
  };
}
```
Then you can enable the configurations in your `configuration.nix`
All programs listed are enabled by default, but can be disabled by setting `programs.${program}.enable = false` - this makes the `zoxide` line redundant.
```nix
{ 
  programs = {
    bat.enable = false;
    zoxide.enable = true;
  };
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
    coreUtils.url = "github:xvrqt/coreUtils-flake";
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
        coreUtils.homemanagerModules.default # <-- This is the important bit
        home.nix
       ];
    };
  };
}
```

Then you can enable the configurations in your `home.nix`
All programs listed are enabled by default, but can be disabled by setting `programs.${program}.enable = false` - this makes the `zoxide` line redundant.
In home-manager, some applications are pre-configured as a crow would configure them. You can override these settings individually in your `home.nix` - for instance `git` is configured with my name and email, so I would recommend changed those values but otherwise happy to take credit for you code :^]
```nix
{ 
  programs = {
    bat.enable = false;
    zoxide.enable = true;
  };
}
```

-----
![Woman works on a computer](https://github.com/xvrqt/coreUtils-flake/blob/dev/patron.png?raw=true "Patron Saint")
P.S. I Love You
