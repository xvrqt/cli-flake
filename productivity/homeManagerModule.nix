{ lib
, pkgs
, config
, ...
}:
let
  ##########################
  ## INSTALL NEW PROGRAMS ##
  ##########################
  # A list of programs that can be installed by simply including their package
  simple_install = [
    "fend"
    "speedtest-rs"
    "tasktimer"
    "weather"
    "wiki-tui"
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
    "broot"
    "fzf"
    "yazi"
    "helix"
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
  productivityEnabled = config.cli.productivity.enable;
in
{
  inherit imports;

  # Creates options to install new programs, and enables them by default
  options.programs =
    if productivityEnabled
    then simple_options
    else { };

  # Does the actual installation of the enabled `programs` options we created
  config.home.packages =
    if productivityEnabled
    then simple_pkgs
    else [ ];
}
