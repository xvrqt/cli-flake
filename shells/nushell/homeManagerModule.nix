{
  lib,
  pkgs,
  config,
  ...
}: let
  cfgCheck = config.programs.nushell.crowConfig && config.programs.nushell.enable;
in {
  config = lib.mkIf cfgCheck {
    programs = {
      nushell = {
        # Sourced in this order, default configs below are
        # Overrideable by a user in their `home.file = {}`
        envFile.source = ./env.nu;
        configFile.source = ./config.nu;
        loginFile.source = ./login.nu;

        extraLogin = "neofetch and echo \"Welcome to Nu, Mistress\"";

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
      # Completion
      carapace = {
        enable = true;
        enableZshIntegration = lib.mkDefault false;
        enableBashIntegration = lib.mkDefault false;
        enableNushellIntegration = true;
      };
      # Pretty Interface
      starship = {
        enable = true;
        enableZshIntegration = lib.mkDefault false;
        enableBashIntegration = lib.mkDefault false;
        enableNushellIntegration = true;
      };

      # Integrations
      direnv.enableNushellIntegration = true;
      # zoxide.enableNushellIntegration = true;
    };

    # Required for the login step
    home = {
      packages = [pkgs.neofetch];
      # Easier to manage than trying to configure in an attrSet
      file = {
        ".config/starship.toml".source = ./starship.toml;
      };
    };
  };
}
