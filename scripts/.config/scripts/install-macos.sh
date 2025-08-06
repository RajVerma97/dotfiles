#!/bin/bash

# Simple macOS dotfiles installer

set -e  # Exit on error

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m' # No Color

print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Detect OS
if [[ "$OSTYPE" == "darwin"* ]]; then
    OS="macos"
    print_status "Detected macOS"
else
    print_error "This script is for macOS only!"
    exit 1
fi

# Install Homebrew if not present
if ! command -v brew &> /dev/null; then
    print_status "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    print_success "Homebrew installed"
else
    print_success "Homebrew already installed"
fi

# Update Homebrew
print_status "Updating Homebrew..."
brew update

# Install packages
if [[ "$OS" == "macos" ]]; then
    print_status "Installing packages..."
    brew install git neovim tmux yazi fzf eza bat autojump zoxide ghostty
    print_success "All packages installed"
fi

print_status "Setup complete!"