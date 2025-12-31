class Macagent < Formula
  desc "Hardware-Aware macOS Agent - Local-first AI that runs directly on your Mac"
  homepage "https://macagent.pro"
  url "https://github.com/midnightnow/macagent-pro/releases/download/v1.2.7/macagent-v1.2.7-rev4-darwin-arm64.tar.gz"
  sha256 "8a580a6976ca82fab7ad6d6f0ff5f36785c3e1ea27c63f4338a16fbbc0cff208"
  version "1.2.7"
  license "MIT"

  depends_on :macos
  depends_on arch: :arm64

  def install
    bin.install "macagent"
  end

  def caveats
    <<~EOS
      MacAgent v1.2.7 "The Soul" (Lean Edition)

      What's New:
        ✅ 21MB Optimized Binary (was 244MB)
        ✅ Claude DNA Personality - Warm, patient, empathetic responses
        ✅ Verbosity Control - /personality terse|balanced|verbose
        ✅ Engineer Mode - Auto-detects coding tasks, outputs code directly
        ✅ Anti-Robot Filter - Scrubs "As an AI language model..." artifacts
        ✅ Persistent Settings - Preferences saved between sessions

      Quick start:
        macagent                   # Interactive mode
        macagent status            # System + LLM readiness
        macagent --help            # Full command reference

      Personality Commands:
        /personality               # Show current settings
        /personality terse         # Short, direct responses
        /personality friendly      # Warm, engaging
        /personality professional  # Formal, efficient

      For local AI (optional):
        brew install ollama && ollama run llama3.2

      Documentation: https://macagent.pro
    EOS
  end

  test do
    assert_match "macagent", shell_output("#{bin}/macagent --help 2>&1", 2)
  end
end
