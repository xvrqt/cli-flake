{ lib
, config
, ...
}:
let
  setDef = lib.mkOverride 1000;
in
{
  config = lib.mkIf config.cli.coreUtils.enable {
    programs.delta = {
      enable = setDef true;
      enableGitIntegration = setDef true;
    };
  };
}
