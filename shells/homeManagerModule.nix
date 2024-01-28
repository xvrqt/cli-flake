let
  shells = ["zsh" "bash" "nushell"];

  # Import shell configuration sub-modules (all enabled by default);
  imports = builtins.map (shell: ./${shell}/homeManagerModule.nix) shells;
in {
  inherit imports;
}
