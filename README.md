# Nix System Configuration for Nix Package Manager (dev Workflow)

Home Manager configuration for managing user packages and dotfiles on Linux using Nix as a secondary package manager.

## Overview

Unlike full NixOS, this setup uses:
- **Home Manager** — manages user packages and home directory configuration
- **Nix** — package manager (installed alongside primary package manager)
- **Flakes** — reproducible package management

System-level configuration (networking, services, GUI apps) is handled by your primary package manager.

## Prerequisites

### Install Nix Package Manager

Follow the official guide: [https://nixos.org/download/](https://nixos.org/download/)

### Enable Flakes (mandatory)

If flakes are not already enabled, add the following to `/etc/nix/nix.conf`:

```
experimental-features = nix-command flakes
```

## Setup

### 1. Clone the Repository

```bash
git clone https://github.com/Venkat-Sundaraneedi/NixManager.git ~/.config/nix_system
cd ~/.config/nix_system
```

### 2. Customize for Your User

Edit `flake.nix` — change the username in `homeConfigurations` (line 17):

```
homeConfigurations.YOUR_USERNAME = home-manager.lib.homeManagerConfiguration {
```

Edit `home.nix` — change `home.username` (line 6) and `home.homeDirectory` (line 7):

```
home.username = "YOUR_USERNAME";
home.homeDirectory = "/home/YOUR_USERNAME";
```

You can find your username with:

```bash
whoami
```

### 3. Build and Activate (First Time)

```bash
nix run home-manager/master -- switch --flake .#YOUR_USERNAME
```

> Replace `YOUR_USERNAME` with the name you used in steps above.

### 4. Post-Setup (Optional)

Set environment variables in your shell config (`.bashrc`, `.zshrc`, `config.fish`, `config.nu`, etc.):

```bash
export NH_HOME_FLAKE="$HOME/.config/nix_system"
export FLAKE="$HOME/.config/nix_system"
```

### 5. Subsequent Updates

```bash
nh home switch
```

Works from anywhere if you set up the environment variables in step 4. Otherwise, run from the project root:

```bash
nix run home-manager/master -- switch --flake .#YOUR_USERNAME
```

### 6. Update Packages

```bash
nix flake update    # must be run from project root
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

- State version is set to `25.11`
- nixpkgs uses unstable channel
- Flakes are enabled (required for this setup)
- System services (mpd, etc.) should be configured via primary package manager

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
nh home list-generations
```
