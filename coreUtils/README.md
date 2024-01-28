# NixOS CLI Utlities
This sub-module provides both NixOS and Home-Manager options to install common CLU system utilities. Like all categories, this one is both arbitrary and biased - and so this sub-module contains mostly utilities rewritten in Rust. These modules create entries under `programs = {}` for each of the utilities listed below, **and enables them by default**. For utilities that already have an entry under the `programs` configuration, this also **enables them by default**. If those entires have configuration options, it sets some sensible defaults. All of these programs can be disabled, or set with their own configurations in your own `configuration.nix` or `home.nix` which will take precedence over the configuration set by the modules.

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
All programs listed are enabled by default, but can be disabled by setting `programs.${program}.enable = false` 
```nix
{ 
  programs = {
    bat.enable = false;
    zoxide.enable = true;
  };
}
```
e.g. this config disables 'bat' and the `zoxide` line redundant because all modules are installed by default

-----
![Woman works on a computer](https://github.com/xvrqt/cli-flake/blob/dev/coreUtils/patron.png?raw=true "Patron Saint")
P.S. I Love You
