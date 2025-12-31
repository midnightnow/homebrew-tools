class Macagent < Formula
  desc "Hardware-Aware macOS Agent - Local-first AI that runs directly on your Mac"
  homepage "https://macagent.pro"
  url "https://github.com/midnightnow/macagent/releases/download/v1.2.7/macagent-v1.2.7-darwin-arm64.tar.gz"
  sha256 "a6c11711c26dff8ee0ea3286a4fc86ece274009150b48e018ecb745259c53008"
  version "1.2.7"
  license "MIT"

  depends_on :macos
  depends_on arch: :arm64

  def install
    bin.install "macagent"
  end

  def caveats
    <<~EOS
      MacAgent v1.2.7

      Quick start:
        macagent status        # Check system + LLM readiness
        macagent              # Interactive mode
        macagent --help       # Full command reference

      For local AI (optional):
        brew install ollama && ollama run llama3.2

      Documentation: https://macagent.pro
    EOS
  end

  test do
    assert_match "macagent", shell_output("#{bin}/macagent --help 2>&1", 2)
  end
end
