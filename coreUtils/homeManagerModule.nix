{
  lib,
  pkgs,
  config,
  ...
}: let
  ##########################
  ## INSTALL NEW PROGRAMS ##
  ##########################
  # A list of utilities that can be installed by simply including their package
  simple_install = [
    "bandwhich"
    "bingrep"
    "croc"
    "cpufetch"
    "ddh"
    "delta"
    "dtool"
    "du-dust"
    "funzzy"
    "glow"
    "grex"
    "hexyl"
    "httm"
    "httpie"
    "hyperfine"
    "kalker"
    "kmon"
    "mprocs"
    "ncdu"
    "neofetch"
    "ouch"
    "procs"
    "pueue"
    "rm-improved"
    "sd"
    "systeroid"
    "tokei"
    "trippy"
  ];

  # For each simple utlity, create an entry in `programs` and enable by default
  simple_options =
    builtins.listToAttrs
    (builtins.map (u: {
        name = u;
        value = {enable = mkEnabled;};
      })
      simple_install);
  # If enabled, install the corresponding package
  simple_pkgs =
    builtins.map
    (u: lib.mkIf config.programs.${u}.enable pkgs.${u})
    simple_install;

  #############################
  ## IMPORT COMPLEX INSTALLS ##
  #############################
  # Import submodules that enable by default, and configure the utilities listed below
  preconfigured_programs = [
    "bat"
    "bottom"
    "eza"
    #    "fd"
    "git"
    "jq"
    "ripgrep"
    "skim"
    "tealdeer"
    "zoxide"
  ];
  imports = builtins.map (u: ./${u}/homeManagerModule.nix) preconfigured_programs;

  ###########################
  ## CONVENIENCE FUNCTIONS ##
  ###########################
  # Creates a programs.${utility}.enable option that defaults to `true`
  mkEnabled = lib.mkOption {
    type = lib.types.bool;
    default = true;
  };

  # Don't enable anything if this isn't set to false (true by default)
  coreUtilsEnabled = config.cli.coreUtils.enable;
in {
  inherit imports;

  # Creates options to install new programs, and enables them by default
  options.programs =
    if coreUtilsEnabled
    then simple_options
    else {};

  # Does the actual installation of the enabled `programs` options we created
  config.home.packages =
    if coreUtilsEnabled
    then simple_pkgs
    else [];
}
