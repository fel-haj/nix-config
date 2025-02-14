{ lib, user, userEmail, ... }:
{
  home.activation.removeExistingGitconfig = lib.hm.dag.entryBefore ["checkLinkTargets"] ''
    rm -f ~/.gitconfig
  '';

  programs.git = {
    enable = true;

    # [l]arge [f]ile [s]torage
    # see https://docs.github.com/en/repositories/working-with-files/managing-large-files/about-git-large-file-storage
    lfs.enable = true;

    userName = user;
    userEmail = userEmail;

    extraConfig = {
      init.defaultBranch = "main";
      github.user = "fel-haj";
      push.autoSetupRemote = true;
      pull.rebase = true;
    };

    # Syntax highlighting
    delta = {
      enable = true;
      options = {
        features = "side-by-side";
      };
    };

    aliases = {
    };
  };

  programs.ssh = {
    enable = true;
    addKeysToAgent = "yes";
    matchBlocks = {
      "github.com" = {
        identityFile = "~/.ssh/id_ed25519";
      };
    };
  };
}
