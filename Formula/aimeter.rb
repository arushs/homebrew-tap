class Aimeter < Formula
  desc "Menu bar app for tracking AI coding agents (Claude Code, OpenCode, Aider, etc.)"
  homepage "https://github.com/arushs/menubar-agent"
  url "https://github.com/arushs/menubar-agent/archive/refs/tags/v1.0.3.tar.gz"
  sha256 "8e5de1d9869ce1193dc871d2d3c2e92fbf60cfca02a6803e8cf9b29a76dcc87d"
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
