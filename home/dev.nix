{ pkgs, ... }:
{
  programs = {
    # neovim = {
    #   enable = true;
    # };

    jujutsu = {
      enable = true;
      settings = { };
    };

    jjui = {
      enable = true;
      settings = { };
    };

    # difftastic = {
    #   enable = true;
    #   jujutsu.enable = true;
    # };

    # lazydocker.enable = true;
    # lazygit.enable = true;
    mergiraf.enable = true;
    bacon.enable = true;
  };

  home.packages = with pkgs; [
    neovim

    # treesitter parsers
    # tree-sitter-grammars.tree-sitter-<lang>

    lazydocker
    lazygit

    # LSPs & Formatters
    typescript-language-server
    lua-language-server
    stylua
    nixd
    nixfmt-tree
    usage

    # Rust dev
    mold
    sccache

    # jjui
    jj-vine
    difftastic

    # Zig
    zigpkgs.master

  ];
}
