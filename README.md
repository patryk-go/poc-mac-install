# macos-homebrew-test

This project is designed to test the end-to-end installation of essential tools on a fresh macOS environment using Homebrew. It includes a series of Brewfiles for different categories of tools, an installation script, and automated tests to ensure everything is set up correctly.

## Project Structure

- **brewfiles/**: Contains Brewfiles for different categories of tools.
  - **system-tools.Brewfile**: Homebrew formulae for basic system tools like `jq` and `dos2unix`.
  - **network-tools.Brewfile**: Homebrew formulae for network-related tools like `nmap`.
  - **monitoring-tools.Brewfile**: Homebrew formulae for monitoring tools like `htop`.

- **scripts/**: Contains the installation script.
  - **install.sh**: A script that checks for Homebrew installation, installs it if necessary, and uses the Brewfiles to install the specified packages. The script is idempotent.

- **tests/**: Contains tests to verify the installation.
  - **installation_test.sh**: A script that checks if the installation was successful and verifies that the tools are available in the system's PATH.

- **.github/workflows/**: Contains the GitHub Actions workflow.
  - **test-install.yml**: Defines the workflow to automate the testing of the installation script on a fresh macOS environment.

## Usage

1. Clone the repository:
   ```bash
   git clone <repository-url>
   cd <git-repo>
   ```

2. Run the installation script:
   ```bash
   ./scripts/install.sh
   ```

3. Verify the installation:
   ```bash
   ./tests/installation_test.sh
   ```

## Contribution

Feel free to contribute to this project by adding more tools or improving the installation script. Make sure to follow the project's structure and guidelines.