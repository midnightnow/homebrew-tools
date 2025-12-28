class Macagent < Formula
  desc "Hardware-Aware macOS Agent - Local-first AI that runs directly on your Mac"
  homepage "https://github.com/midnightnow/claude-code-tools"
  url "https://github.com/midnightnow/claude-code-tools/releases/download/v1.0.0-beta/macagent-v1.0.0-beta-darwin-arm64.tar.gz"
  sha256 "1896099c86d9615b9cbedb891b0d6d55b653dd4d166505223dcdf67f60ede4d0"
  version "1.0.0-beta"
  license "MIT"

  depends_on :macos
  depends_on arch: :arm64

  def install
    bin.install "macagent"
    libexec.install "daemon.py"
    libexec.install "config"
    libexec.install "plugins"
    
    # Create wrapper for daemon
    (bin/"macagent-daemon").write <<~EOS
      #!/bin/bash
      python3 "#{libexec}/daemon.py" "$@"
    EOS
  end

  def caveats
    <<~EOS
      For instant startup, run the daemon:
        macagent-daemon start

      Check status:
        macagent-daemon status

      Then use macagent normally:
        macagent
    EOS
  end

  test do
    assert_match "MacAgent Pro", shell_output("#{bin}/macagent --help 2>&1", 0)
  end
end
