{
  lib,
  config,
  ...
}: let
  setDef = lib.mkOverride 1000;
in {
  config = lib.mkIf config.cli.media.enable {
    programs.mpv = {
      enable = setDef true;
    };
    services.plex-mpv-shim.enable = true;
  };
}
