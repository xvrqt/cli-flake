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

      languages = [
        {
          name = "rust";
          auto-format = true;
        }
      ];

      settings = {
        theme = "catppuccin-mocha";
        editor = {
          line-number = "relative";
          cursor-line = true;
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
        ".config/helix/themes/theme.toml".source = ./themes/catppuccin-mocha.toml;
      };
    };
  };
}
