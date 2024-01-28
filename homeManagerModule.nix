{lib, ...}: let
  # Note: 'shells' are handled separately, as they are not simple CLI programs
  submodules = ["coreUtils" "shells"];
  ###########################
  ## CONVENIENCE FUNCTIONS ##
  ###########################
  # Creates a programs.${utility}.enable option that defaults to `true`
  mkEnabled = lib.mkOption {
    type = lib.types.bool;
    default = true;
  };

  ############################################
  ## GENERATE 'ENABLE' OPTION PER SUBMODULE ##
  ############################################
  cli =
    builtins.listToAttrs
    (builtins.map (u: {
        name = u;
        value = {enable = mkEnabled;};
      })
      submodules);
  options = {
    inherit cli;
    programs = {
      zsh.crowConfig = mkEnabled;
      bash.crowConfig = mkEnabled;
      nushell.crowConfig = mkEnabled;
    };
  };
  #######################
  ## IMPORT SUBMODULES ##
  #######################
  imports =
    builtins.map
    (u: ./${u}/homeManagerModule.nix)
    submodules;
  # ++ [./shells/homeManagerModule.nix];
in {
  inherit imports;
  inherit options;
}
