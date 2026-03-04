{
  config,
  pkgs,
  ...
}: {
  home.username = "greed";
  home.homeDirectory = "/home/greed";
  home.stateVersion = "25.11";

  home.packages = with pkgs; [
    # Version Control
    nix-prefetch-github

    # LSPs & Formatters
    alejandra # nix formatter
    nil

    # Nix Helpers
    nh
    nix-output-monitor
    nvd
  ];


  home.file = {};

  programs = {
    home-manager.enable = true;
  };

  nixpkgs.config.allowUnfree = true;
}
