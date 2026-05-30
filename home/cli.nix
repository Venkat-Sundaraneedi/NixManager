{ pkgs, ... }:
{
  programs = {
    bat.enable = true;
    himalaya.enable = true;
    jq.enable = true;
    ripgrep.enable = true;
    zellij.enable = true;
  };

  # CLI tools
  home.packages = with pkgs; [
    dust
    p7zip
    rainfrog
    tokei
    tree-sitter
    usql
    xh

    # Solana / Web3
    anchor
    surfpool
  ];
}
