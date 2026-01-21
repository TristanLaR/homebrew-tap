class Glance < Formula
  desc "Minimal markdown viewer with live preview"
  homepage "https://github.com/TristanLaR/glance"
  version "0.1.1"
  license "MIT"

  on_macos do
    url "https://github.com/TristanLaR/glance/releases/download/v#{version}/glance-macos.tar.gz"
    sha256 "7a17e955bf8c21f380f548a374ef24d74d2f27d0588298308865ddcdce2730a0"

    def install
      prefix.install "glance.app"
      bin.write_exec_script prefix/"glance.app/Contents/MacOS/glance"
    end
  end

  on_linux do
    url "https://github.com/TristanLaR/glance/releases/download/v#{version}/glance-linux-x86_64.tar.gz"
    sha256 "603e0e243255503514acc5d6dddb2c88fd142c50c6003f5c694809457d756b9d"

    def install
      bin.install "glance"
    end
  end

  def caveats
    on_linux do
      <<~EOS
        Run this once to complete setup:
          sudo apt install libwebkit2gtk-4.0-37 libgtk-3-0
          echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.bashrc && source ~/.bashrc
      EOS
    end
  end

  test do
    assert_match "glance", shell_output("#{bin}/glance --version 2>&1", 1)
  end
end
