cask "virtualdisplay" do
  version "0.13.0"
  sha256 "d6a62b3e2d940464cdfa06e31204931dbdeea37e3d92f555f103118a734dab7d"

  url "https://github.com/fredp46/virtualdisplay-releases/releases/download/v#{version}/VirtualDisplay-#{version}.zip"
  name "VirtualDisplay"
  desc "Push or share a window to a virtual display and serve it over VNC"
  homepage "https://github.com/fredp46/virtualdisplay-releases"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :sonoma

  app "VirtualDisplay.app"

  uninstall quit: "com.fredpowell.VirtualDisplay"

  zap trash: [
    "~/Library/Caches/com.fredpowell.VirtualDisplay",
    "~/Library/HTTPStorages/com.fredpowell.VirtualDisplay",
    "~/Library/Preferences/com.fredpowell.VirtualDisplay.plist",
  ]
end
