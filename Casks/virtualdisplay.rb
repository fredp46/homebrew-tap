cask "virtualdisplay" do
  version "0.4.0"
  sha256 "ee607cf19386d9556450d158bb3c2a0874ebf5ff36a63edcc73f1b6e1a482131"

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
end
