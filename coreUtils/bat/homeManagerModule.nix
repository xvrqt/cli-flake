{
  lib,
  pkgs,
  config,
  ...
}: let
  setDef = lib.mkOverride 1000;
in {
  config = lib.mkIf config.cli.coreUtils.enable {
    programs.bat = {
      enable = setDef true;
      themes = {
        catppuccin-mocha = {
          src = pkgs.fetchFromGitHub {
            owner = "catppuccin";
            repo = "bat";
            rev = "ba4d16880d63e656acced2b7d4e034e4a93f74b1";
            sha256 = null;
          };
          file = "catppuccin-mocha.tmTheme";
        };
      };
      config = {
        theme = setDef "catppuccin-mocha";
      };
    };
  };
}
