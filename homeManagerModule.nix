{
  lib,
  nixosModule,
  ...
}: let
  # Note: 'shells' are handled separately, as they are not simple CLI programs
  submodules = ["coreUtils" "productivity" "media"];
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
  # Don't repeat the options if the caller is using the combined NixOS + Home Manager Module
  options = {
    inherit cli;
    programs = {
      bash.crowConfig = mkEnabled;

      zsh = {
        crowConfig = mkEnabled;
      };

      nushell = {
        enabled = mkEnabled;
        crowConfig = mkEnabled;
      };
    };
  };

  #######################
  ## IMPORT SUBMODULES ##
  #######################
  imports =
    builtins.map
    (u: ./${u}/homeManagerModule.nix)
    submodules
    ++ [./shells/homeManagerModule.nix];
in {
  inherit imports;
  inherit options;
}
