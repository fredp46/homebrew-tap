cask "virtualdisplay" do
  version "0.5.0"
  sha256 "f0f784f58548ca76df8fb4c3f965424df6bdce32740d62940f65773e15baae5e"

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
