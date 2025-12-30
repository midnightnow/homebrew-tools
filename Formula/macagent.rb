class Macagent < Formula
  desc "Hardware-Aware macOS Agent - Local-first AI that runs directly on your Mac"
  homepage "https://macagent.pro"
  url "https://cdn.macagent.pro/bin/v1.2.3/macagent-v1.2.3-darwin-arm64.tar.gz"
  sha256 "d75179299e400c646caf391cc8acec020455f7855570e2554e893d1d84d0052c"
  version "1.2.3"
  license "MIT"

  depends_on :macos
  depends_on arch: :arm64

  def install
    bin.install "macagent"
  end

  def caveats
    <<~EOS
      MacAgent v1.2.3 - "Slim & Auto-Start"

      What's New:
        * 15x smaller (21MB vs 325MB)
        * Auto-starts Ollama when needed
        * Faster startup

      Quick start:
        macagent status        # Check system + LLM readiness
        macagent chat "..."    # Interactive AI chat
        macagent --help        # Full command reference

      For local AI:
        brew install ollama
        ollama pull llama3.2:1b

      Documentation: https://macagent.pro
    EOS
  end

  test do
    assert_match "macagent", shell_output("#{bin}/macagent --help 2>&1", 2)
  end
end
