{
  lib,
  config,
  ...
}: let
  setDef = lib.mkOverride 1000;
in {
  config = lib.mkIf config.cli.coreUtils.enable {
    programs.skim = {
      enable = setDef true;
      enableBashIntegration = setDef true;
      enableFishIntegration = setDef true;
      enableZshIntegration = setDef true;
    };
  };
}
