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
    nixpkgs-review

    # LSPs & Formatters
    nil
    alejandra

    # Nix Helpers
    nh
    nix-output-monitor
    nvd

    usage
    jq
    fzf
    jujutsu
    jjui
    jj-vine
    xh
    zellij
    difftastic

    lua-language-server
    stylua
    typescript-language-server

    usql
    rainfrog

    surfpool
    anchor

    tokei
    mergiraf
  ];


  home.file = {};

  programs = {
    home-manager.enable = true;
  };

  nixpkgs.config.allowUnfree = true;
}
