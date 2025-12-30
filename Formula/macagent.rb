class Macagent < Formula
  desc "Hardware-Aware macOS Agent - Local-first AI that runs directly on your Mac"
  homepage "https://macagent-pro.web.app"
  url "https://github.com/midnightnow/macagent-pro/releases/download/v1.2.1/macagent-v1.2.1-darwin-arm64.tar.gz"
  sha256 "fc5042da9155a1e3db19fed4ec5c3b7347e2b041edf8db7bef1666c953775af5"
  version "1.2.1"
  license "MIT"

  depends_on :macos
  depends_on arch: :arm64

  def install
    bin.install "macagent"
  end

  def caveats
    <<~EOS
      MacAgent Pro v1.2.1 installed!

      Quick start:
        macagent status        # Check system readiness
        macagent see "..."     # Vision analysis
        macagent plan "..."    # Task planning
        macagent --help        # Full command reference

      Hardware-aware features:
        - Thermal monitoring (throttles on high temp)
        - Battery optimization (adjusts on low power)
        - Memory management (adapts to available RAM)
        - Offline mode (works without internet)

      Documentation: https://macagent-pro.web.app
    EOS
  end

  test do
    assert_match "macagent", shell_output("#{bin}/macagent --help 2>&1", 2)
  end
end
