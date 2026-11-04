cask "virtualdisplay" do
  version "0.12.1"
  sha256 "7d9116838950d91e258d2cb945884cd680a66340746911a8fc89fac84f55cac1"

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
