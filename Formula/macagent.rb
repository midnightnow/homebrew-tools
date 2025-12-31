class Macagent < Formula
  desc "Hardware-Aware macOS Agent - Local-first AI that runs directly on your Mac"
  homepage "https://macagent.pro"
  url "https://cdn.macagent.pro/bin/v1.2.7/macagent-v1.2.7-darwin-arm64.tar.gz"
  sha256 "c0664ce84063294d403073214e92ca8032572bc5d88da5f5eb4ffb8726c7b960"
  version "1.2.7"
  license "MIT"

  depends_on :macos
  depends_on arch: :arm64

  def install
    bin.install "macagent"
  end

  def caveats
    <<~EOS
      MacAgent v1.2.7 "The Soul"

      What's New:
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
