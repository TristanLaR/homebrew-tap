cask "glance" do
  version "0.1.1"
  sha256 "b3e0ee4eefa604813ce77642f19f2cdbd2a61dea234fc11844f7e929a4f92266"

  url "https://github.com/TristanLaR/glance/releases/download/v#{version}/glance-macos.tar.gz"
  name "Glance"
  desc "Minimal markdown viewer with live preview"
  homepage "https://github.com/TristanLaR/glance"

  app "glance.app"
  binary "glance.app/Contents/MacOS/glance"

  zap trash: [
    "~/Library/Application Support/com.glance.app",
    "~/Library/Caches/com.glance.app",
    "~/Library/Preferences/com.glance.app.plist",
  ]
end
