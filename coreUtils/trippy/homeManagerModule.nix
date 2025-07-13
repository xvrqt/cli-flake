{ lib
, config
, ...
}:
let
  setDef = lib.mkOverride 1000;
in
{
  config = lib.mkIf config.cli.coreUtils.enable {
    programs.trippy = {
      enable = setDef true;
    };
  };
}
