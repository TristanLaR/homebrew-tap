class Glance < Formula
  desc "Minimal markdown viewer with live preview"
  homepage "https://github.com/TristanLaR/glance"
  version "0.1.3"
  license "MIT"

  on_macos do
    url "https://github.com/TristanLaR/glance/releases/download/v#{version}/glance-macos.tar.gz"
    sha256 "9e7b8e723d76caf304167047d97dd77eed0f1abb15dba10ccbc5069fa36d9ac7"

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
    sha256 "842862df07e70ed90924ec94774e5aa905d969019d829e8d2ef62c3396c90f0b"

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
