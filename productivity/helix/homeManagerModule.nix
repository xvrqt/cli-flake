{
  lib,
  pkgs,
  config,
  ...
}: let
  setDef = lib.mkOverride 1000;
in {
  config = lib.mkIf config.cli.productivity.enable {
    programs.helix = {
      enable = setDef true;

      languages = {
        rust = {
          auto-format = true;
        };
      };

      settings = {
        theme = "catppuccin_mocha";
        editor = {
          line-number = "relative";
          cursorline = true;
          color-modes = true;
          lsp.display-messages = true;
          cursor-shape = {
            insert = "bar";
            normal = "block";
            select = "underline";
          };
        };
      };
    };

    home = {
      #packages = [pkgs.ueberzugpp pkgs.unar];
      packages = [pkgs.unar]; # Removed Ueberzugpp because it wasn't building and doesn't work anyways
      file = {
        ".config/helix/themes/default.toml".source = ./themes/catppuccin-mocha.toml;
      };
    };
  };
}
