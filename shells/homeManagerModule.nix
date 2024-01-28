{config, ...}: let
  shells = ["zsh" "bash" "nushell"];
  shellsEnabled = config.cli.shells.enable;

  # Import shell configuration sub-modules (all enabled by default);
  imports =
    if shellsEnabled
    then builtins.map (shell: ./${shell}/homeManagerModule.nix) shells
    else [];
in {
  inherit imports;
}
