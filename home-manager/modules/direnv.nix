{
  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    config = {
      load_dotenv = true;
    };
    stdlib = "source_up .env";
  };
}
