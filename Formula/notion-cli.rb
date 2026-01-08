class NotionCli < Formula
  desc "CLI tool for interacting with Notion API"
  homepage "https://github.com/arushs/notion-cli"
  url "https://github.com/arushs/notion-cli/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  license "MIT"
  head "https://github.com/arushs/notion-cli.git", branch: "main"

  depends_on "pipx"
  depends_on "python@3.12"

  def install
    system "pipx", "install", ".", "--python", Formula["python@3.12"].opt_bin/"python3.12"

    # Link the pipx-installed binary
    bin.install_symlink Dir["#{HOMEBREW_PREFIX}/bin/notion"]
  end

  def caveats
    <<~EOS
      notion-cli has been installed via pipx.
      The `notion` command should be available in your PATH.
    EOS
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/notion --help")
  end
end
