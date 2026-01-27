class Glance < Formula
  desc "Minimal markdown viewer with live preview"
  homepage "https://github.com/TristanLaR/glance"
  version "0.1.3"
  license "MIT"

  on_macos do
    url "https://github.com/TristanLaR/glance/releases/download/v#{version}/glance-macos.tar.gz"
    sha256 "1a62aca99606dd4ab4329d5b72a710b8c81339e5ea163c37ce2ef01fd5773169"

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
    sha256 "de0c56226dc3ecbe45989e0aa621169e5fa0e737a868cd144214e0f144bf6b4d"

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
          sudo apt install libwebkit2gtk-4.0-0 libgtk-3-0
      EOS
    end
  end

  test do
    assert_match "glance", shell_output("#{bin}/glance --version 2>&1", 1)
  end
end
