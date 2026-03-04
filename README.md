# Nix System Configuration for Arch WSL

This directory contains Home Manager configuration for managing user packages and dotfiles on Arch Linux WSL using Nix as a secondary package manager.

## Overview

Unlike full NixOS, this setup uses:
- **Home Manager** - manages user packages and home directory configuration
- **Nix** - package manager (installed alongside pacman)
- **Flakes** - reproducible package management

System-level configuration (networking, services, GUI apps) is handled by Arch/pacman.

## Setup

### 1. Initial Setup (First Time)

```bash
# Navigate to this directory
cd ~/projects/solana/nix_system

# Build and activate Home Manager configuration
nix run home-manager/master -- switch --flake .#greed
```

### 2. Subsequent Updates

```bash
# Update and apply configuration
home-manager switch --flake .#greed

# Or if home-manager is not in PATH yet
nix run home-manager/master -- switch --flake .#greed
```

### 3. Update Packages

```bash
# Update flake inputs
nix flake update

# Apply updates
home-manager switch --flake .#greed
```

## Structure

```
nix_system/
├── flake.nix      # Home Manager flake configuration
├── home.nix       # User packages and configuration
├── flake.lock     # Locked dependencies (auto-generated)
└── README.md      # This file
```

## GUI Applications

GUI applications have been removed from this configuration. Install them via pacman:

```bash
# Browser
sudo pacman -S brave

# Terminal
sudo pacman -S ghostty

# File manager
sudo pacman -S nautilus

# Discord
sudo pacman -S discord
```

## Notes

- State version is set to "25.11" (matching your NixOS config)
- nixpkgs uses unstable channel
- Flakes are enabled (required for this setup)
- System services (mpd, etc.) should be configured via Arch systemd

## Useful Commands

```bash
# Search for packages
nix search nixpkgs <package-name>

# Enter a shell with specific packages
nix shell nixpkgs#<package>

# Run a package without installing
nix run nixpkgs#<package>

# Garbage collect unused packages
nix-collect-garbage -d

# Show Home Manager generations
home-manager generations
```
