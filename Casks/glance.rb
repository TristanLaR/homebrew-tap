cask "glance" do
  version "0.1.1"
  sha256 "7a17e955bf8c21f380f548a374ef24d74d2f27d0588298308865ddcdce2730a0"

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
