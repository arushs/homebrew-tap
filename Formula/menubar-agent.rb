class MenubarAgent < Formula
  desc "Menu bar app for tracking CLI coding agents (Claude Code, OpenCode, Aider, etc.)"
  homepage "https://github.com/arushs/menubar-agent"
  url "https://github.com/arushs/menubar-agent/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "6aed1aff391c4e7289f6838ee985e80607b0f39492d35abd8aa54c5803e6a506"
  license "MIT"

  depends_on :macos
  depends_on xcode: ["15.0", :build]

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/menubar-agent"
  end

  service do
    run opt_bin/"menubar-agent"
    keep_alive true
    log_path var/"log/menubar-agent.log"
  end

  test do
    assert_predicate bin/"menubar-agent", :executable?
  end
end
