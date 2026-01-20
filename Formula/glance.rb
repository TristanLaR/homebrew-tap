class Glance < Formula
  desc "Minimal markdown viewer with live preview"
  homepage "https://github.com/TristanLaR/glance"
  version "0.1.0"
  license "MIT"

  on_macos do
    url "https://github.com/TristanLaR/glance/releases/download/v#{version}/glance-macos.tar.gz"
    sha256 "a9e302d427d5fc846edf76d89a361d2f8c1502707ec4294b775fdf6b4b1af582"

    def install
      prefix.install "glance.app"
      bin.write_exec_script prefix/"glance.app/Contents/MacOS/glance"
    end
  end

  on_linux do
    url "https://github.com/TristanLaR/glance/releases/download/v#{version}/glance-linux-x86_64.tar.gz"
    # sha256 will need to be updated after first Linux release
    sha256 "PLACEHOLDER_LINUX_SHA256"

    depends_on "gtk+3"
    depends_on "webkit2gtk"

    def install
      bin.install "glance"
    end
  end

  test do
    assert_match "glance", shell_output("#{bin}/glance --version 2>&1", 1)
  end
end
