let
  shells = ["zsh" "bash" "nushell"];
  # Import shell configuration sub-modules
  imports = builtins.map (shell: ./${shell}/homeManagerModule.nix) shells;
in {
  inherit imports;
}
