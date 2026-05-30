{ ... }:
{
  imports = [
    ./nix.nix
    ./shell.nix
    ./dev.nix
    ./cli.nix
    ./services.nix
  ];
  home = {
    username = "greed";
    homeDirectory = "/home/greed";
    stateVersion = "26.11";
    # enableNixpkgsReleaseCheck = false;
  };
  programs.home-manager.enable = true;
}
