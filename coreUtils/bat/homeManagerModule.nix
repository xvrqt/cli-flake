{
  lib,
  config,
  ...
}: let
  setDef = lib.mkOverride 1000;
in {
  config = lib.mkIf config.cli.coreUtils.enable {
    programs.bat = {
      enable = setDef true;
      config = {
        theme = setDef "catppuccin-mocha";
      };
    };
    # Copy the custom themes to the `bat` config directory
    home.file = {
      ".config/bat/themes" = {
        source = ./themes;
        recursive = true;
      };
    };
  };
}
