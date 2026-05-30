{ pkgs, inputs, ... }:
{
  nixpkgs = {
    config.allowUnfree = true;
    overlays = [
      inputs.zig.overlays.default
      inputs.neovim-nightly-overlay.overlays.default
    ];
  };

  programs.nh = {
    enable = true;
    homeFlake = /home/greed/.config/nix_system;
    clean = {
      enable = true;
      extraArgs = "--keep 5 --keep-since 3d";
    };
  };

  home.packages = with pkgs; [
    # Nix helpers
    nix-output-monitor
    nvd
    nix-prefetch-github
    nixpkgs-review
  ];
}
