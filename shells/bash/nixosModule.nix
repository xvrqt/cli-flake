{
  lib,
  config,
  ...
}: let
  cfgCheck = config.programs.bash.crowConfig;
in {
  config = lib.mkIf cfgCheck {
    programs.bash = {
      completion.enable = true;
    };
  };
}
