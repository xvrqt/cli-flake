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
        theme = setDef "base16";
      };
    };
    # Copy the custom themes to the `bat` config directory
    home.file = {
      ".config/bat/themes/catppuccin-mocha.tmTheme".source = ./themes/catppuccin-mocha.tmTheme;
    };
  };
}
