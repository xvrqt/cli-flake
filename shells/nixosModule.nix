let
  shells = ["zsh" "bash" "fish" "nushell"];
  # Import shell configuration sub-modules
  imports = builtins.map (shell: ./${shell}/nixosModule.nix) shells;
in {
  inherit imports;
}
