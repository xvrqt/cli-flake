{
  lib,
  pkgs,
  config,
  ...
}: let
  cfgCheck = config.programs.bash.crowConfig && config.programs.bash.enable;
in {
  config = lib.mkIf cfgCheck {
    programs.bash = {
      enableCompletion = true;

      # History
      historyControl = ["ignorespace" "ignoredups"];
      historyFile = "/tmp/bash_history";
      historyFileSize = 10000;
      # History stored in memory
      historySize = 100;

      # Login/Logout Shells
      profileExtra = "echo \"Welcome to bash, Mistress\"";
      logoutExtra = "echo \"P.S. I Love You\"\n";
    };
    home.packages = [pkgs.neofetch];
  };
}
