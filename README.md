# Nix System Configuration for Nix Package Manager (dev Workflow)

This directory contains Home Manager configuration for managing user packages and dotfiles on Linux using Nix as a secondary package manager.

## Overview

Unlike full NixOS, this setup uses:
- **Home Manager** - manages user packages and home directory configuration
- **Nix** - package manager (installed alongside primary package manager)
- **Flakes** - reproducible package management

System-level configuration (networking, services, GUI apps) is handled by your Primary Package Manager.

## Setup

### 1. Initial Setup (First Time)

```bash
git clone https://github.com/Venkat-Sundaraneedi/NixManager.git ~/.config/nix_system

# Navigate to this directory
cd ~/.config/nix_system

# Build and activate Home Manager configuration
nix run home-manager/master -- switch --flake .#greed
```

### 2. Post Initial Setup

In flake.nix change the name from "greed" to your username in "homeConfigurations.greed" so you don't have to mention .#greed while doing `nh home switch`

you will know your username with

```bash
whoami
```

Setup env Variable NH_HOME_FLAKE,FLAKE to ~/.config/nix_system in your shell config (.bashrc,.zshrc,config.fish,config.nu,...etc)


### 3. Subsequent Updates

```bash
# Update and apply configuration (will work from anywhere if you setup env variable)
nh home switch
```

### 4. Update Packages

```bash
# Update flake inputs (you have to be in project root to do this)
nix flake update

# Apply updates
nh home switch
```

## Structure

```
nix_system/
├── flake.nix      # Home Manager flake configuration
├── home.nix       # User packages and configuration
├── flake.lock     # Locked dependencies (auto-generated)
└── README.md      # This file
```

## Notes

- State version is set to "25.11" (matching your NixOS config)
- nixpkgs uses unstable channel
- Flakes are enabled (required for this setup)
- System services (mpd, etc.) should be configured via Pimary Package Manager

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
