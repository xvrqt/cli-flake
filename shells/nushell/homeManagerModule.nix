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

        extraLogin = "hyfetch; echo \"Welcome to Nu, Mistress\"";

        shellAliases = {
          ## Convenience
          c = "clear";

          # Common Typos
          ".." = "cd ..";
          "cd.." = "cd ..";

          # Resume wget downloads
          wget = "wget -c";
          top = "atop";

          ## SAFETY
          rm = "rm -I";
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
      packages = [pkgs.hyfetch];
    };
  };
}
