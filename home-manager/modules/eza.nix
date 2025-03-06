{
  programs.eza = {
    enable = true;
    git = true;
    icons = "auto";
    colors = "auto";
    enableZshIntegration = true;
    extraOptions = [
      "-l" # Long listing format
      "--group-directories-first"
      "--git"
    ];
  };
}
