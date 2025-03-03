{ lib, user, hostName, ... }:
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
    userEmail = "78931101+fel-haj@users.noreply.github.com";

    signing = {
      format = "ssh";
      key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEv1auuK81LyTEQulVtayIZG/jh6cHl/302LmxmEXXO6 78931101+fel-haj@users.noreply.github.com";
      signByDefault = true;
    };

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
        identityFile = "~/.ssh/gh/${hostName}";
        identitiesOnly = true;
      };
    };
  };
}
