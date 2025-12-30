class Aimeter < Formula
  desc "Menu bar app for tracking AI coding agents (Claude Code, OpenCode, Aider, etc.)"
  homepage "https://github.com/arushs/menubar-agent"
  url "https://github.com/arushs/menubar-agent/archive/refs/tags/v1.0.2.tar.gz"
  sha256 "de10bd756577758a30befb0a76d040d54deb16a3c404e056b79f03c483895442"
  license "MIT"

  depends_on :macos
  depends_on xcode: ["15.0", :build]

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/aimeter"
  end

  service do
    run opt_bin/"aimeter"
    keep_alive true
    log_path var/"log/aimeter.log"
  end

  test do
    assert_predicate bin/"aimeter", :executable?
  end
end
