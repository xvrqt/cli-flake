# FISH Configuration
{
  lib,
  config,
  ...
}: let
  cfgCheck = config.programs.fish.crowConfig;
  initializeScript = "clear && hyfetch";
in {
  config = lib.mkIf cfgCheck {
    programs = {
      fish = {
        # Print system information on login
        shellInit = initializeScript;
        loginShellInit = initializeScript;
        interactiveShellInit = initializeScript;

        # Translate BASH scripts to FISH scripts so you can run them
        useBabelFish = true;

        # Useful shortcuts
        shellAliases = {
          ## Convenience
          c = "clear";
          # Common Typos
          ".." = "cd ..";
          "cd.." = "cd ..";
          # Always create parent directories
          mkdir = "mkdir -pv";
          # Resume wget downloads
          wget = "wget -c";
          top = "atop";

          ## INFO
          h = "history";
          j = "jobs -l";
          now = "date +\"%T\"";
          ping = "ping -c 5";
          ports = "netstat -tulnap";
          meminfo = "free -m -l -t";
          # Top process eating memory
          psmem = "ps auxf | sort -nr -k 4";
          psmem10 = "ps auxf | sort -nr -k 4 | head -10";
          cpuinfo = "lscpu";
          # Top process eating CPU
          pscpu = "ps auxf | sort -nr -k 3";
          pscpu10 = "ps auxf | sort -nr -k 3 | head -10";

          ## SAFETY
          rm = "rm -I --preserve-root";
          mv = "mv -i";
          cp = "cp -i";
          ln = "ln -i";
          chown = "chown --preserve-root";
          chmod = "chmod --preserve-root";
          chgrp = "chgrp --preserve-root";
        };
      };
    };
  };
}
