{ pkgs, ... }:
{
  programs = {
    fzf = {
      enable = true;
      enableFishIntegration = true;
    };

    eza = {
      enable = true;
      enableFishIntegration = true;
    };

    direnv = {
      # enable = true;
      enableBashIntegration = true;
      enableFishIntegration = true;
      nix-direnv.enable = true;
    };

  };

  home.packages = with pkgs; [
    zoxide
    carapace
  ];
}
