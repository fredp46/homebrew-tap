cask "virtualdisplay" do
  version "0.3.0"
  sha256 "34f67a8fe3fc1f8c88870f43db735973f596b82ef9bb4ec086dc5b4604f83697"

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
