# Hyprland pre-configured via home-manager module
{
  pkgs,
  packages,
  ...
}: let
  # Convenience, as the theme needs to be set for many different plugins
  ## dracula, gruvbox, molokai, palenight, solarized_dark, onedark, catppuccin
  theme = "catppuccin";
  style = "mocha";
in {
  # Import the flake's home-manager module
  imports = [packages.features.cli.neovim.neovim.homeManagerModules.default];

  # Do our own configuring
  programs.neovim-flake = {
    enable = true;

    settings.vim = {
      viAlias = true;
      vimAlias = true;
      debugMode = {
        enable = false;
        level = 20;
        logFile = "/tmp/nvim.log";
      };

      # Keybindings
      maps = {
        # Commands for insert mode
        insert = {
          # Shortcuts for exiting insert mode
          "jk" = {
            noremap = true;
            action = "<Esc>";
          };
          "jj" = {
            noremap = true;
            action = "<Esc>";
          };
          "kj" = {
            noremap = true;
            action = "<Esc>";
          };
          "kk" = {
            noremap = true;
            action = "<Esc>";
          };
        };
      };

      lsp = {
        formatOnSave = true;
        lspkind.enable = false;
        lightbulb.enable = true;
        lspsaga.enable = false;
        nvimCodeActionMenu.enable = true;
        trouble.enable = true;
        lspSignature.enable = true;
        lsplines.enable = true;
        nvim-docs-view.enable = true;
      };

      debugger = {
        nvim-dap = {
          enable = true;
          ui.enable = true;
        };
      };

      languages = {
        enableLSP = true;
        enableFormat = true;
        enableTreesitter = true;
        enableExtraDiagnostics = true;

        nix.enable = true;
        html.enable = true;
        clang = {
          enable = true;
          lsp.server = "clangd";
        };
        sql.enable = false;
        rust = {
          enable = true;
          crates.enable = true;
        };
        java.enable = false;
        ts.enable = false;
        svelte.enable = false;
        go.enable = false;
        zig.enable = true;
        python.enable = true;
        dart.enable = false;
        elixir.enable = false;
        bash.enable = true;
        terraform.enable = false;
      };

      visuals = {
        enable = true;
        nvimWebDevicons.enable = true;
        scrollBar.enable = true;
        smoothScroll.enable = true;
        cellularAutomaton.enable = false;
        fidget-nvim.enable = true;
        highlight-undo.enable = true;

        indentBlankline = {
          enable = true;
          fillChar = null;
          eolChar = null;
          scope = {
            enabled = true;
          };
        };

        cursorline = {
          enable = true;
          lineTimeout = 0;
        };
      };

      statusline = {
        lualine = {
          enable = true;
          theme = "${theme}";
        };
      };

      theme = {
        enable = true;
        name = "${theme}";
        style = "${style}";
        transparent = false;
      };
      autopairs.enable = true;

      autocomplete = {
        enable = true;
        type = "nvim-cmp";
      };

      filetree = {
        nvimTree = {
          enable = true;
        };
      };

      tabline = {
        nvimBufferline.enable = true;
      };

      treesitter.context.enable = true;

      binds = {
        whichKey.enable = true;
        cheatsheet.enable = true;
      };

      telescope.enable = true;

      git = {
        enable = true;
        gitsigns.enable = true;
        gitsigns.codeActions = false; # throws an annoying debug message
      };

      minimap = {
        minimap-vim.enable = false;
        codewindow.enable = true; # lighter, faster, and uses lua for configuration
      };

      dashboard = {
        dashboard-nvim.enable = false;
        alpha.enable = true;
      };

      notify = {
        nvim-notify.enable = true;
      };

      projects = {
        project-nvim.enable = true;
      };

      utility = {
        ccc.enable = true;
        vim-wakatime.enable = false;
        icon-picker.enable = true;
        surround.enable = true;
        diffview-nvim.enable = true;
        motion = {
          hop.enable = true;
          leap.enable = true;
        };
      };

      notes = {
        obsidian.enable = false; # FIXME neovim fails to build if obsidian is enabled
        orgmode.enable = false;
        mind-nvim.enable = true;
        todo-comments.enable = true;
      };

      terminal = {
        toggleterm = {
          enable = true;
          lazygit.enable = true;
        };
      };

      ui = {
        borders.enable = true;
        noice.enable = true;
        colorizer.enable = true;
        modes-nvim.enable = false; # the theme looks terrible with catppuccin
        illuminate.enable = true;
        breadcrumbs = {
          enable = true;
          navbuddy.enable = true;
        };
        smartcolumn = {
          enable = true;
          columnAt.languages = {
            # this is a freeform module, it's `buftype = int;` for configuring column position
            nix = 110;
            ruby = 120;
            java = 130;
            go = [90 130];
          };
        };
      };

      assistant = {
        copilot = {
          enable = false;
          cmp.enable = false;
        };
      };

      session = {
        nvim-session-manager.enable = false;
      };

      gestures = {
        gesture-nvim.enable = false;
      };

      comments = {
        comment-nvim.enable = true;
      };

      presence = {
        presence-nvim = {
          enable = true;
          auto_update = true;
          image_text = "The Superior Text Editor";
          client_id = "793271441293967371";
          main_image = "neovim";
          show_time = true;
          rich_presence = {
            editing_text = "Editing %s";
          };
        };
      };
    };
  };
}
