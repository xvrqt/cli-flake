{
  lib,
  config,
  ...
}: let
  setDef = lib.mkOverride 1000;
in {
  config = lib.mkIf config.cli.productivity.enable {
    programs.broot = {
      enable = setDef true;

      enableBashIntegration = true;
      enableZshIntegration = true;
      enableNushellIntegration = true;

      settings = {
        modal = true;
        skin = {};
      };
    };
  };
}
