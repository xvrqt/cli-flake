{lib, ...}: let
  # Note: 'shells' are handled separately
  submodules = ["coreUtils"];
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
    # Add options to configure and enable the shells
    programs = {
      zsh.crowConfig = mkEnabled;
      bash.crowConfig = mkEnabled;
      fish = {
        crowConfig = mkEnabled;
      };
      nushell = {
        enable = lib.mkEnableOption "NuShell";
        crowConfig = mkEnabled;
      };
    };
  };
  #######################
  ## IMPORT SUBMODULES ##
  #######################
  imports =
    (builtins.map
      (u: ./${u}/nixosModule.nix)
      submodules)
    ++ [./shells/nixosModule.nix];
in {
  inherit imports;
  inherit options;
}
