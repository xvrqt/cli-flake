{
  programs.git = {
    enable = true;

    userName = "Amy Jie";
    userEmail = "git@xvrqt.com";

    # Common CLI shortcuts
    aliases = {
      del = "branch -D";
      br = "branch --format='%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(contents:subject) %(color:green)(%(committerdate:relative)) [%(authorname)]' --sort=-committerdate";
    };

    # Nicer 'diff' experience inside git ;::; https://github.com/dandavison/delta
    ## Consider using "difftastic" or "diff-so-fancy" if you ever decided to use it
    delta = {
      enable = true;
      options = {
        decorations = {};
      };
    };
  };
}

