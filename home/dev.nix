{ pkgs, ... }:
{
  programs = {
    mise = {
      enable = true;
      enableFishIntegration = true;
    };

    jujutsu = {
      enable = true;
      settings = { };
    };

    jjui = {
      enable = true;
      settings = { };
    };
    mergiraf.enable = true;
  };

  home.packages = with pkgs; [
    # treesitter parsers
    # tree-sitter-grammars.tree-sitter-<lang>

    lazydocker
    lazygit

    # LSPs & Formatters
    typescript-language-server
    vscode-json-languageserver
    # asm-lsp
    taplo
    lua-language-server
    stylua
    usage

    # jjui
    jj-vine
    difftastic
  ];
}
