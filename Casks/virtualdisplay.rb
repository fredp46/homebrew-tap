cask "virtualdisplay" do
  version "0.14.1"
  sha256 "60a265508277db9697c6611f9faa4e4792463c0a505d912007aab8ed39beb2ad"

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
