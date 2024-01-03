{pkgs, ...}: {
  imports = [
    ./jq.nix # Pretty Print and Manipulate JSON
    ./zsh.nix # shell
    ./git.nix # version control
    ./bat.nix # cat replacement
    ./fuck.nix # CLI command fixer
    ./eza.nix # ls replacement
    ./bash.nix # el classico
    ./direnv.nix # allow per-directory environment variables
    ./bottom.nix # System Viewer
    ./ripgrep.nix # grep replacement
    ./tealdeer.nix # man page replacement
  ];

  # CLI tools that are not natively configurable within home-manager
  home.packages = with pkgs; [
    ueberzugpp
    bc # Calculator
    fd # Better Find
    sd # sed alternative
    nil # Nix LSP
    croc # Easily send files to another computer
    navi # CLI cheatsheet
    grex # Generate regex from examples
    ncdu # TUI Disk Usage
    procs # ps replacement
    tokei # code statistics
    nixfmt # Nix Formatter
    httpie # Better curl/wget
    figlet # Makes large ascii art out of text
    ranger # File browser
    lolcat # Prints text in a rainbow
    bottom # top alternative
    du-dust # du replacement in rust
    weather # CLI weather fetcher
    termusic # Music player
    cpufetch # Pretty Print CPU Info
    hyperfine # CLI benchmarking tool
    #zenith # System Utilization Monitor
    bandwhich # CLI utility for displaying current network utilization
    emoji-picker # Search through emojis
    diffsitter # Better diff
  ];
}
