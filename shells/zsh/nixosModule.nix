{
  lib,
  config,
  ...
}: let
  cfgCheck = config.programs.zsh.crowConfig && config.programs.zsh.enable;
in {
  config = lib.mkIf cfgCheck {
    programs.zsh = {
      enableCompletion = true;
      autosuggestions.enable = true;

      # ENHANCE
      ohMyZsh = {
        enable = true;
        theme = "jonathan";
        plugins = ["git"];
      };
    };
  };
}
