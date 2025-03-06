{
  # programs.neovim creates init.lua - conflicts with symlink
  xdg.configFile."nvim/init.lua".enable = false;

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    vimAlias = true;
  };
}
