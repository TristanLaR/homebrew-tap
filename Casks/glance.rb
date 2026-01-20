cask "glance" do
  version "0.1.1"
  sha256 "19ef3b9bc884850f6ee78b56d57788cc3a1bd872555075635703ada5f08a3176"

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
