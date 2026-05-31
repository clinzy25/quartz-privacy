```sh
#!/usr/bin/env bash
# =============================================
# Ubuntu 24.04+ System Full Upgrade Script
# =============================================

set -e  # Exit immediately if a command fails
set -u  # Treat unset variables as errors
set -o pipefail

echo "🔄 Starting full system update and upgrade..."
echo "--------------------------------------------"

# 1. Refresh repositories
sudo apt update

# 2. Upgrade all installed packages
sudo apt upgrade -y
flatpak update -y

# 3. Perform a full system upgrade (handles kernel, dependencies, etc.)
sudo apt full-upgrade -y

# 4. Distribution upgrade (for new Ubuntu releases, e.g., 24.04 → 24.10)
echo "⚙ Checking for Ubuntu release upgrades..."
sudo do-release-upgrade -f DistUpgradeViewNonInteractive || echo "No new release available or upgrade deferred."

# 5. Remove old dependencies and clean cache
sudo apt autoremove -y
sudo apt autoclean -y
sudo apt clean

# 6. Update Flatpaks (if installed)
if command -v flatpak &> /dev/null; then
    echo "📦 Updating Flatpak packages..."
    sudo flatpak update -y
else
    echo "⚠ Flatpak not installed — skipping Flatpak updates."
fi

echo "✅ System upgrade complete!"
echo "💡 A reboot is recommended if the kernel or core packages were updated."
```