class Macagent < Formula
  desc "Hardware-Aware macOS Agent - Local-first AI that runs directly on your Mac"
  homepage "https://macagent.pro"
  url "https://github.com/midnightnow/macagent/releases/download/v1.2.2/macagent-v1.2.2-darwin-arm64.tar.gz"
  sha256 "6608a90290aea16f4dd81b7ffd8b1a4be8e09f42ce6701293ac4ef9db9d1b8a2"
  version "1.2.2"
  license "MIT"

  depends_on :macos
  depends_on arch: :arm64

  def install
    bin.install "macagent"
  end

  def caveats
    <<~EOS
      MacAgent v1.2.2 - "Zombie Brain Fix"

      What's Fixed:
        ✅ Graceful error when no AI backend available
        ✅ Helpful "Install Ollama" message instead of crash
        ✅ Circuit breaker improvements

      Quick start:
        macagent status        # Check system + LLM readiness
        macagent chat "..."    # Interactive AI chat
        macagent --help        # Full command reference

      For local AI (required):
        brew install ollama && ollama serve
        ollama pull llama3.2:1b

      Documentation: https://macagent.pro
    EOS
  end

  test do
    assert_match "macagent", shell_output("#{bin}/macagent --help 2>&1", 2)
  end
end
