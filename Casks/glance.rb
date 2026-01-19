cask "glance" do
  version "0.1.0"
  sha256 "PLACEHOLDER_SHA256"

  url "https://github.com/TristanLaR/glance/releases/download/v#{version}/glance-macos.tar.gz"
  name "Glance"
  desc "Minimal markdown viewer with live preview"
  homepage "https://github.com/TristanLaR/glance"

  app "glance.app"

  zap trash: [
    "~/Library/Application Support/com.glance.app",
    "~/Library/Caches/com.glance.app",
    "~/Library/Preferences/com.glance.app.plist",
  ]
end
