class Glance < Formula
  desc "Minimal markdown viewer with live preview"
  homepage "https://github.com/TristanLaR/glance"
  version "0.1.1"
  license "MIT"

  on_macos do
    url "https://github.com/TristanLaR/glance/releases/download/v#{version}/glance-macos.tar.gz"
    sha256 "19ef3b9bc884850f6ee78b56d57788cc3a1bd872555075635703ada5f08a3176"

    def install
      prefix.install "glance.app"
      bin.write_exec_script prefix/"glance.app/Contents/MacOS/glance"
    end
  end

  on_linux do
    url "https://github.com/TristanLaR/glance/releases/download/v#{version}/glance-linux-x86_64.tar.gz"
    sha256 "9e3dc3804ecc7f8eb3482261eb1148433e5c2df40182f045cccba99faf833749"

    def install
      bin.install "glance"
    end
  end

  def caveats
    on_linux do
      <<~EOS
        Linux users: Install runtime dependencies first:
          sudo apt install libwebkit2gtk-4.0-37 libgtk-3-0
      EOS
    end
  end

  test do
    assert_match "glance", shell_output("#{bin}/glance --version 2>&1", 1)
  end
end
