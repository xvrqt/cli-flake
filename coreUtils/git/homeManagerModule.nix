{ lib
, config
, ...
}:
let
  setDef = lib.mkOverride 1000;
in
{
  config = lib.mkIf config.cli.coreUtils.enable {
    programs.git = {
      enable = setDef true;
      settings = {
        user = {
          email = setDef "git@xvrqt.net";
          name = setDef "crow";
        };
        init = {
          defaultBranch = "master";
        };
      };
    };
  };
}
