# NixOS Shells
This sub-module provides both NixOS and Home-Manager modules that preconfigure the following shells:
- [ZSH](https://www.zsh.org/)
- [BASH](https://www.gnu.org/software/bash/)
= [NuShell](https://www.nushell.sh/)

Things like auto-complete, nice themes, sane config, history, and other defaults.

## Usage
```nix
{
  programs = {
    # Bash doesn't have an 'enable' option and you are not allowed to set it
    bash = {
      crowConfig = true; # This configures the shell as a crow would.
    };
    zsh = {
      enable = true;
      crowConfig = true; # This configures the shell as a crow would.
    };
    nushell = {
      enable = true;
      crowConfig = true; # This configures the shell as a crow would.
    };
  };
}
```
-----
![Woman works on a computer](https://github.com/xvrqt/cli-flake/blob/dev/shells/patron.png?raw=true "Patron Saint")
P.S. I Love You
