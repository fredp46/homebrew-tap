cask "virtualdisplay" do
  version "0.1.0"
  sha256 "8fa96f802818b2e1e8b6f148d4456edeb129aa4b52bb01786be757293548e883"

  url "https://github.com/fredp46/virtualdisplay-releases/releases/download/v#{version}/VirtualDisplay-#{version}.zip"
  name "VirtualDisplay"
  desc "Push or share a window to a virtual display and serve it over VNC"
  homepage "https://github.com/fredp46/virtualdisplay-releases"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :sonoma"

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
