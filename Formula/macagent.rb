class Macagent < Formula
  desc "Hardware-Aware macOS Agent - Local-first AI that runs directly on your Mac"
  homepage "https://macagent.pro"
  url "https://github.com/midnightnow/macagent/releases/download/v1.2.5/macagent-v1.2.5-darwin-arm64.tar.gz"
  sha256 "13d00b288053dcd53468e0017c3f51b26e27f1a858251d41a8e2cc047b267276"
  version "1.2.5"
  license "MIT"

  depends_on :macos
  depends_on arch: :arm64

  def install
    bin.install "macagent"
  end

  def caveats
    <<~EOS
      MacAgent v1.2.5 (Lean Machine)

      Quick start:
        macagent               # Interactive AI chat & Helper
        macagent status        # Check system + LLM readiness
        macagent --help        # Full command reference

      For local AI (optional):
        brew install ollama && ollama run llama3.2

      Documentation: https://macagent.pro
    EOS
  end

  test do
    assert_match "macagent", shell_output("#{bin}/macagent --help 2>&1", 2)
  end
end
