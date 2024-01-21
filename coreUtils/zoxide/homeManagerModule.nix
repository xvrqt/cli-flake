{
  lib,
  config,
  ...
}: let
  setDef = lib.mkOverride 1000;
in {
  config = lib.mkIf config.cli.coreUtils.enable {
    programs.zoxide = {
      enable = setDef true;
      enableZshIntegration = setDef true;
      # enableNushellIntegration = setDef true;
      enableBashIntegration = setDef true;
      enableFishIntegration = setDef true;
    };
  };
}
