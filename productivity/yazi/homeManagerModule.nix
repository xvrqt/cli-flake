{
  lib,
  pkgs,
  config,
  ...
}: let
  setDef = lib.mkOverride 1000;
in {
  config = lib.mkIf config.cli.productivity.enable {
    programs.yazi = {
      enable = setDef true;

      enableBashIntegration = true;
      enableZshIntegration = true;
      enableNushellIntegration = true;
    };

    home = {
      #packages = [pkgs.ueberzugpp pkgs.unar];
      packages = [pkgs.unar]; // Removed Ueberzugpp because it wasn't building and doesn't work anyways
      file = {
        ".config/yazi/theme.toml".source = ./themes/catppuccin-mocha.toml;
      };
    };
  };
}
