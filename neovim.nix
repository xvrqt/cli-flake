# Hyprland pre-configured via home-manager module
{packages, ...}: {
  # Reimport the neovim home-manager module
  imports = [packages.features.cli.neovim.homeManagerModules.default];

  # Pre-configure the package
  programs = {
    neovim-flake = {
      enable = true;
      settings = {
        vim = {
          viAlias = true;
          vimAlias = true;
          lsp = {
            # Currently deprecated, hasn't been updated so throws an error
            # every time nvim is run. Removing for now.
            sql.enable = false;
          };
        };
      };
    };
  };
}
