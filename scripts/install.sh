#!/usr/bin/env bash
set -e

install_homebrew() {
  if ! command -v brew &> /dev/null; then
    echo "Homebrew not found. Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  else
    echo "Homebrew is already installed."
  fi
}

install_packages() {
  for brewfile in ./brewfiles/*.Brewfile; do
    echo "Installing packages from $brewfile..."
    brew bundle --file="$brewfile"
  done
}

main() {
  install_homebrew
  install_packages
  echo "Installation complete."
}

# Execute main function
main
