{ pkgs,  ... }:
{
  nixpkgs = {
    config.allowUnfree = true;
    overlays = [
    ];
  };

  programs.nh = {
    enable = true;
    homeFlake = /home/greed/.config/nix_system;
    clean = {
      enable = true;
      extraArgs = "--keep 1 --keep-since 1d";
    };
  };

  home.packages = with pkgs; [
    # Nix helpers
    nix-output-monitor
    nixd
    nixfmt-tree
    nix-prefetch-github
    nix-update
    nixpkgs-reviewFull
  ];
}
