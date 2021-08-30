class Pmm < Formula
  desc "Package manager manager"
  homepage "https://github.com/kdb424/pmm"
  url "https://github.com/kdb424/pmm/archive/refs/tags/0.4.0.tar.gz"
  sha256 "de8c36d55c2726c917cb73f6646f8981831a139cc8f6e0bc0eab11bf89143c4d"
  license "MIT"
  head "https://github.com/kdb424/pmm.git", branch: "main", tag: "0.4.0"

  depends_on "nim" => :build

  def install
    ENV.deparallelize
    system "make"
    bin.install "#{buildpath}/pmm"
  end

  test do
    assert_match "Pmm #{version}", shell_output("#{bin}/pmm --version")
  end
end
