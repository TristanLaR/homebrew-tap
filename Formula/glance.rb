class Glance < Formula
  desc "Minimal markdown viewer with live preview"
  homepage "https://github.com/TristanLaR/glance"
  version "0.1.1"
  license "MIT"

  on_macos do
    url "https://github.com/TristanLaR/glance/releases/download/v#{version}/glance-macos.tar.gz"
    sha256 "b3e0ee4eefa604813ce77642f19f2cdbd2a61dea234fc11844f7e929a4f92266"

    def install
      prefix.install "glance.app"
      bin.write_exec_script prefix/"glance.app/Contents/MacOS/glance"
    end
  end

  on_linux do
    url "https://github.com/TristanLaR/glance/releases/download/v#{version}/glance-linux-x86_64.tar.gz"
    sha256 "5c9a1a45bc2b01d226c70db9be93ebe68498361ce5581f314e873e11c61dedfb"

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
