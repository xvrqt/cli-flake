{
  lib,
  config,
  ...
}: let
  setDef = lib.mkOverride 1000;
in {
  config = lib.mkIf config.cli.media.enable {
    programs.feh = {
      enable = setDef true;
    };
  };
}
