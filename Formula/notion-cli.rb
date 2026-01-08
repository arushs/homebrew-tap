class NotionCli < Formula
  desc "CLI tool for interacting with Notion API"
  homepage "https://github.com/arushs/notion-cli"
  url "https://github.com/arushs/notion-cli/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "cdd3971663cac561d57d8b557d9d0d679ec748111b7551ddbd13e82c239a91ca"
  license "MIT"
  head "https://github.com/arushs/notion-cli.git", branch: "master"

  depends_on "pipx"
  depends_on "python@3.12"

  def install
    system "pipx", "install", ".", "--python", Formula["python@3.12"].opt_bin/"python3.12"
    bin.install_symlink "#{HOMEBREW_PREFIX}/bin/notion"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/notion --help", 0)
  end
end
