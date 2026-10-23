cask "virtualdisplay" do
  version "0.2.0"
  sha256 "9f3abd3a98875d84231268952f0367bc5973c0f6f7ee31d851e6025e24a68c96"

  url "https://github.com/fredp46/virtualdisplay-releases/releases/download/v#{version}/VirtualDisplay-#{version}.zip"
  name "VirtualDisplay"
  desc "Push or share a window to a virtual display and serve it over VNC"
  homepage "https://github.com/fredp46/virtualdisplay-releases"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "VirtualDisplay.app"

  uninstall quit: "com.fredpowell.VirtualDisplay"

  zap trash: "~/Library/Preferences/com.fredpowell.VirtualDisplay.plist"

  caveats <<~EOS
    This preview build isn't notarized by Apple yet, so macOS blocks its first launch.
    To allow it, open VirtualDisplay once, then click Open Anyway in
    System Settings → Privacy & Security. Or run:
      xattr -dr com.apple.quarantine #{appdir}/VirtualDisplay.app
  EOS
end
