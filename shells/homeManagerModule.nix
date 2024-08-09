{
  lib,
  config,
  ...
}: let
  shells = ["zsh" "bash" "nushell"];

  # If any of the shells have "crowConfig = true; then enable some options
  crowConfigured = config.programs.zsh.crowConfig || config.programs.nushell.crowConfig || config.programs.bash.crowConfig;
  # Import shell configuration sub-modules (all enabled by default);
  imports = builtins.map (shell: ./${shell}/homeManagerModule.nix) shells;
in {
  inherit imports;
  config = {
    home.file.".config/starship.toml".source = lib.mkIf crowConfigured ./starship.toml;
  };
}
