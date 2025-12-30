class Macagent < Formula
  desc "Hardware-Aware macOS Agent - Local-first AI that runs directly on your Mac"
  homepage "https://macagent.pro"
  url "https://github.com/midnightnow/macagent-pro/releases/download/v1.2.1/macagent-v1.2.1-darwin-arm64.tar.gz"
  sha256 "5ee57227f2cbebf23f5a7e36009bd52477c1e0218e472f3dcd099c15c6ab0e8f"
  version "1.2.1"
  license "MIT"

  depends_on :macos
  depends_on arch: :arm64

  def install
    bin.install "macagent"
  end

  def caveats
    <<~EOS
      MacAgent v1.2.1 - "The Fulcrum Release"

      What's Fixed:
        ✅ Startup crash resolved (unified provider import)
        ✅ Config now bundled (no more "file not found")
        ✅ Self-sovereign binary (hermetic distribution)

      Quick start:
        macagent status        # Check system + LLM readiness
        macagent chat "..."    # Interactive AI chat
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
