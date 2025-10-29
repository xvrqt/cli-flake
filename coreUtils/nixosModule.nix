{ lib
, pkgs
, config
, ...
}:
let
  ##########################
  ## INSTALL NEW PROGRAMS ##
  ##########################
  # A list of utilities that can be installed by simply including their package
  simple_install = [
    "bingrep"
    "bottom"
    "cpufetch"
    "croc"
    "ddh"
    "delta"
    "dtool"
    "du-dust"
    "eza"
    "fd"
    "funzzy"
    "glow"
    "grex"
    "helix"
    "hexyl"
    "httm"
    "httpie"
    "hyperfine"
    "jq"
    "kalker"
    "kmon"
    "mprocs"
    "ncdu"
    "hyfetch"
    "ouch"
    "procs"
    "pueue"
    "ripgrep"
    "rm-improved"
    "sd"
    "systeroid"
    "tealdeer"
    "tokei"
  ];

  # For each simple utlity, create an entry in `programs` and enable by default
  simple_options =
    builtins.listToAttrs
      (builtins.map
        (u: {
          name = u;
          value = { enable = mkEnabled; };
        })
        simple_install);
  # If enabled, install these simple utilities
  simple_pkgs =
    builtins.map
      (u: lib.mkIf config.programs.${u}.enable pkgs.${u})
      simple_install;

  ##############################
  ## ENABLE EXISTING PROGRAMS ##
  ##############################

  # A list of utilities that already have a `programs` entry that need to be enabled
  enable_install = [
    "bandwhich"
    "bat"
    "git"
    "skim"
    "trippy"
    "zoxide"
  ];
  # Enable these programs by default
  enabled_programs =
    builtins.listToAttrs
      (builtins.map
        (u: {
          name = u;
          value = { enable = resetDef true; };
        })
        enable_install);

  ###########################
  ## CONVENIENCE FUNCTIONS ##
  ###########################

  # Creates a programs.${utility}.enable option that defaults to `true`
  mkEnabled = lib.mkOption {
    type = lib.types.bool;
    default = true;
  };

  # Sets a configuration to a higher priority than its default, but lower than the user's config
  resetDef = lib.mkOverride 1000;
  # Don't enable anything if this isn't set to false (true by default)
  coreUtilsEnabled = config.cli.coreUtils.enable;
in
{
  # Creates options to install new programs, and enables them by default
  options.programs =
    if coreUtilsEnabled
    then simple_options
    else { };

  # Enables programs that already had a `programs` entry by default
  config.programs =
    if coreUtilsEnabled
    then enabled_programs
    else { };

  # Does the actual installation of the enabled `programs` options we created
  config.environment.systemPackages =
    if coreUtilsEnabled
    then simple_pkgs
    else [ ];
}
