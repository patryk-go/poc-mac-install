#!/usr/bin/env bash
set -e

check_tool() {
  local tool=$1
  if command -v "$tool" &> /dev/null; then
    echo "$tool is installed."
    return 0
  else
    echo "$tool is not installed."
    return 1
  fi
}

# Organize tools by categories matching Brewfile
REQUIRED_TOOLS=(
  # Basic development tools
  "curl"
  "dos2unix"
  "fzf"
  "jq"
  "mc"      # midnight-commander
  "rg"      # ripgrep
  "tmux"
  "tree"
  "wget"

  # Security
  "gpg"     # gnupg

  # Git tools
  "ghq"
  "git"
  "git-crypt"
  "git-filter-repo"
  "git-lfs"

  # Containers
  "colima"
  "docker"
  "docker-buildx"

  # Monitoring tools
  "htop"

  # Network tools
  "mtr"
  "nmap"
)

check_docker() {
  if ! colima status &> /dev/null; then
    echo "Docker (colima) is not running."
    return 1
  fi
  echo "Docker (colima) is running."
  return 0
}

check_docker_completion() {
  if [ -f "/usr/local/share/zsh/site-functions/_docker" ] || \
     [ -f "/opt/homebrew/share/zsh/site-functions/_docker" ]; then
    echo "Docker completion is installed."
    return 0
  fi
  echo "Docker completion is not installed."
    return 1
}

main() {
  local exit_status=0
  local failed_tools=()

  # Check all required tools
  for tool in "${REQUIRED_TOOLS[@]}"; do
    if ! check_tool "$tool"; then
      exit_status=1
      failed_tools+=("$tool")
    fi
  done

  # Additional docker checks
  if ! check_docker; then
    exit_status=1
    failed_tools+=("docker-runtime")
  fi

  if ! check_docker_completion; then
    exit_status=1
    failed_tools+=("docker-completion")
  fi

  # Print results
  if [ $exit_status -eq 0 ]; then
    echo "All tools are installed successfully."
  else
    echo "Failed to verify these tools: ${failed_tools[*]}"
  fi

  exit $exit_status
}

main
