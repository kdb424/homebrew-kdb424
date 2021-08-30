class Pmm < Formula
  desc "Package manager manager"
  homepage "https://github.com/kdb424/pmm"
  url "https://github.com/kdb424/pmm/archive/refs/tags/0.4.0.tar.gz"
  sha256 "e98e234ed2c2e2f057ef43d6ae78f979c469b1375774ceffa653139709d9d540"
  license "MIT"
  head "https://github.com/kdb424/pmm.git", branch: "main", tag: "0.4.0"

  depends_on "nim" => :build
  depends_on "pandoc" => :build

  def install
    ENV.deparallelize
    system "make"
    bin.install "#{buildpath}/pmm"
  end

  test do
    assert_match "Pmm #{version}", shell_output("#{bin}/pmm --version")
  end
end
