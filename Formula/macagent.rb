class Macagent < Formula
  desc "Hardware-Aware macOS Agent - Local-first AI that runs directly on your Mac"
  homepage "https://macagent.pro"
  url "https://github.com/midnightnow/macagent/releases/download/v1.2.3/macagent-v1.2.3-darwin-arm64.tar.gz"
  sha256 "88d58e6fbc1f53e60d65dc57bb94f424b96c9194d9e54479542baa5a329d8e71"
  version "1.2.3"
  license "MIT"

  depends_on :macos
  depends_on arch: :arm64

  def install
    bin.install "macagent"
  end

  def caveats
    <<~EOS
      MacAgent v1.2.3 "Zombie Brain Fix"

      Changes:
        - Fixed: Auto-start local AI (Ollama) if not running
        - Fixed: Version banner accuracy

      Quick start:
        macagent status        # Check system + LLM readiness
        macagent chat "..."    # Interactive AI chat
        macagent --help        # Full command reference

      For local AI:
        brew install ollama && ollama run llama3.2

      Docs: https://macagent.pro
    EOS
  end

  test do
    assert_match "macagent", shell_output("#{bin}/macagent --help 2>&1", 2)
  end
end
