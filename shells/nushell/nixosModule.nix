{
  lib,
  pkgs,
  config,
  ...
}: let
  cfgCheck = config.programs.nushell.crowConfig && config.programs.nushell.enable;
in {
  config = lib.mkIf cfgCheck {
    environment.systemPackages = [pkgs.nushell];
  };
}
