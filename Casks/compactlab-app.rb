# Homebrew cask for the menu bar app, for LemonCANDY42/homebrew-tap (Casks/compactlab-app.rb).
# app/scripts/cask.sh fills in the version and checksum from a notarized disk image attached to the release.
cask "compactlab-app" do
  version "0.2.0"
  sha256 "d57837f5db37b3bea8121b38a9ec4a403781ca891ed2fe8f411502a745969382"

  url "https://github.com/LemonCANDY42/compactlab/releases/download/v#{version}/compactlab-#{version}.dmg"
  name "compactlab"
  desc "Menu bar app for context headroom and calibrated auto-compact thresholds"
  homepage "https://github.com/LemonCANDY42/compactlab"

  depends_on formula: "lemoncandy42/tap/compactlab"
  depends_on macos: :sonoma

  app "compactlab.app"

  uninstall quit: "io.github.lemoncandy42.compactlab"

  # The app's own preferences only: ~/.compactlab belongs to the compactlab formula (results, backups, manifests).
  zap trash: "~/Library/Preferences/io.github.lemoncandy42.compactlab.plist"
end
