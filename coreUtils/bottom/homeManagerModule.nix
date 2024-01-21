{
  lib,
  config,
  ...
}: let
  setDef = lib.mkOverride 1000;
in {
  config = lib.mkIf config.cli.coreUtils.enable {
    programs.bottom = {
      enable = setDef true;
    };
    # Set the configuration
    home.file = {
      ".config/bottom/bottom.toml".source = ./bottom.toml;
    };
  };
}
