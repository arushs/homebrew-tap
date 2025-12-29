class Aimeter < Formula
  desc "Menu bar app for tracking AI coding agents (Claude Code, OpenCode, Aider, etc.)"
  homepage "https://github.com/arushs/menubar-agent"
  url "https://github.com/arushs/menubar-agent/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "0ba06d063bd13f97525585c23ddfa759f30be1382b035ff0e0ec55463f593693"
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
