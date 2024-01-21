{
  lib,
  config,
  ...
}: let
  setDef = lib.mkOverride 1000;
in {
  config = lib.mkIf config.cli.coreUtils.enable {
    programs.eza = {
      enable = setDef true;
      git = setDef true;
      icons = setDef true;
      enableAliases = setDef true;
    };
  };
}
