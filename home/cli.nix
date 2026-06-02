{ pkgs, ... }:
{
  programs = {
    zellij.enable = true;
    jq.enable = true;
    ripgrep.enable = true;
    bat.enable = true;
  };

  # CLI tools
  home.packages = with pkgs; [
    dust
    tokei
    tree-sitter
    usql
    xh
    turso
    lazysql
  ];
}
