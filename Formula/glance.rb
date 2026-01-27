class Glance < Formula
  desc "Minimal markdown viewer with live preview"
  homepage "https://github.com/TristanLaR/glance"
  version "0.1.3"
  license "MIT"

  on_macos do
    url "https://github.com/TristanLaR/glance/releases/download/v#{version}/glance-macos.tar.gz"
    sha256 "7e41980fea62dc5625615ac5713a1320372ca1e3b1754c20091a361423fc1f16"

    def install
      prefix.install "glance.app"
      bin.write_exec_script prefix/"glance.app/Contents/MacOS/glance"

      # Install shell completions
      zsh_completion.write <<~EOS
        #compdef glance
        _glance() {
          _arguments '1: :_files -g "*.md"' && return 0
        }
        _glance
      EOS

      bash_completion.write <<~EOS
        _glance_completion() {
          COMPREPLY=($(compgen -f -- "${COMP_WORDS[1]}"))
        }
        complete -o default -o bashdefault -o filenames -F _glance_completion glance
      EOS
    end
  end

  on_linux do
    url "https://github.com/TristanLaR/glance/releases/download/v#{version}/glance-linux-x86_64.tar.gz"
    sha256 "626db8c1f5590f9b8926eaeac27eca487e0e3f554b82eda154c0e419d549d27a"

    def install
      bin.install "glance"

      # Install shell completions
      zsh_completion.write <<~EOS
        #compdef glance
        _glance() {
          _arguments '1: :_files -g "*.md"' && return 0
        }
        _glance
      EOS

      bash_completion.write <<~EOS
        _glance_completion() {
          COMPREPLY=($(compgen -f -- "${COMP_WORDS[1]}"))
        }
        complete -o default -o bashdefault -o filenames -F _glance_completion glance
      EOS
    end
  end

  def caveats
    on_linux do
      <<~EOS
        Required system dependency (run once):
          sudo apt install libwebkit2gtk-4.1-0 libgtk-3-0
      EOS
    end
  end

  test do
    assert_match "glance", shell_output("#{bin}/glance --version 2>&1", 1)
  end
end
