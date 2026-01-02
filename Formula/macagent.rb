class Macagent < Formula
  desc "Hardware-Aware macOS Agent - Local-first AI that runs directly on your Mac"
  homepage "https://macagent.pro"
  url "https://cdn.macagent.pro/bin/v2.2.0/macagent-v2.2.0-darwin-arm64.tar.gz"
  sha256 "1ed94c13c1ef0654ada2aba9e67355bc1b8761913d8efca045fd8b20628c6afd"
  version "2.2.0"
  license "MIT"

  depends_on :macos
  depends_on arch: :arm64

  def install
    bin.install "macagent"
  end

  def caveats
    <<~EOS
      MacAgent v2.2.0 "Iron Sentinel" (Security Build)

      What's New:
        🛡️ Operation Iron Sentinel - Full Security Hardening
        🛡️ Workspace Containment - Defenses against path traversal
        🛡️ RCE Protection - AST validation for generated code
        🛡️ Circuit Breaker - Rate limiting for autonomous repairs
        ✅ Human-in-the-Loop - Confirmation required for risky edits


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
