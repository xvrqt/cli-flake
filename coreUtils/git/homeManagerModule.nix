{
  lib,
  config,
  ...
}: let
  setDef = lib.mkOverride 1000;
in {
  config = lib.mkIf config.cli.coreUtils.enable {
    programs.git = {
      enable = setDef true;
      userName = setDef "xvrqt";
      userEmail = setDef "git@xvrqt.com";
      extraConfig = {
          init = {
            defaultBranch = "master";
          };
      };
      # Diff program
      delta = {
        enable = setDef true;
      };
    };
  };
}
