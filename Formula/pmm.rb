class Pmm < Formula
  desc "Package manager manager"
  homepage "https://github.com/kdb424/pmm"
  url "https://github.com/kdb424/pmm/archive/refs/tags/0.4.1.tar.gz"
  sha256 "0ddb91d542a50a239e37fb0ce43752e4d0cdd80e42499be04906c0442d882109"
  license "MIT"
  head "https://github.com/kdb424/pmm.git", branch: "main", tag: "0.4.1"

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
