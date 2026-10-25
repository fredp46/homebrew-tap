cask "virtualdisplay" do
  version "0.3.2"
  sha256 "12497b97175bd8dbb8292a0e14ddf0356422b3584cfc587a05fe11df3952fd11"

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
