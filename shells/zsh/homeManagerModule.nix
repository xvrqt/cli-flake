# ZSH Configuration
{
  lib,
  pkgs,
  config,
  ...
}: let
  cfgCheck = config.programs.zsh.crowConfig && config.programs.zsh.enable;
in {
  config = lib.mkIf cfgCheck {
    programs = {
      zsh = {
        dotDir = ".config/zsh";
        enableCompletion = true;
        enableAutosuggestions = true;

        # Use VI like keymaps inside the shell
        defaultKeymap = "vicmd";

        # Pretty colors
        syntaxHighlighting = {
          enable = true;
        };

        ###########
        ## LOGIN ##
        ###########
        # Should add this under 'neofetch' since we don't know it's installed
        # "zshIntegration"
        loginExtra = "clear && neofetch";

        #############
        ## HISTORY ##
        #############

        history = {
          # Timestamp history entries
          extended = true;
          # If new command mathces previous, only store latest command in history
          ignoreDups = true;
          # Do not enter command lines into the history if the first character is a <space>
          ignoreSpace = true;
          # Where to store the history file
          path = "$HOME/.config/zsh/history.log";
          # Number of commands to save/keep in the history
          save = 10000;
          size = 10000;
          # Share command history between shell sessions
          share = true;
          # Enable substring matching in history
        };

        # Searching the history is it's own object I gues :|
        historySubstringSearch = {
          enable = true;
        };

        #############
        ## ALIASES ##
        #############

        shellGlobalAliases = {
        };

        shellAliases = {
          ## Convenience
          c = "clear";
          # Common Typos
          ".." = "cd ..";
          "cd.." = "cd ..";
          # Always create parent directories
          mkdir = "mkdir -pv";
          # Resume wget downloads
          wget = "wget -c";
          top = "atop";

          ## INFO
          h = "history";
          j = "jobs -l";
          now = "date +\"%T\"";
          ping = "ping -c 5";
          ports = "netstat -tulnap";
          meminfo = "free -m -l -t";
          # Top process eating memory
          psmem = "ps auxf | sort -nr -k 4";
          psmem10 = "ps auxf | sort -nr -k 4 | head -10";
          cpuinfo = "lscpu";
          # Top process eating CPU
          pscpu = "ps auxf | sort -nr -k 3";
          pscpu10 = "ps auxf | sort -nr -k 3 | head -10";

          ## SAFETY
          rm = "rm -I --preserve-root";
          mv = "mv -i";
          cp = "cp -i";
          ln = "ln -i";
          chown = "chown --preserve-root";
          chmod = "chmod --preserve-root";
          chgrp = "chgrp --preserve-root";

          ## Editor
          vi = "nvim";
          vim = "nvim";
          edit = "nvim";
        };

        ###############
        ## OH-MY-ZSH ##
        ###############

        oh-my-zsh = {
          enable = true;
          plugins = [
            "fzf"
            "git"
            "rust"
            "aliases"
            "git-prompt"
            "zsh-interactive-cd"
          ];
          theme = "jonathan";
        };
      };

      # Additional programs that power ZSH's functionality
      fzf = {
        enable = true;
        enableZshIntegration = true;
      };

      # Pretty Prompt
      starship = {
        enable = true;
        enableZshIntegration = true;
        enableBashIntegration = lib.mkDefault false;
        enableNushellIntegration = lib.mkDefault false;
      };
    };

    # Needed for the login shell
    home.packages = [pkgs.neofetch];
  };
}
