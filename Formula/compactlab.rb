class Compactlab < Formula
  include Language::Python::Virtualenv

  desc "Recommend auto-compact thresholds from your own coding-agent logs"
  homepage "https://github.com/LemonCANDY42/compactlab"
  url "https://github.com/LemonCANDY42/compactlab/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "3434e114bae2abf8da5a71800c20ed47eb8f2025141e9e7bb27f4d166476a048"
  license "MIT"
  head "https://github.com/LemonCANDY42/compactlab.git", branch: "main"

  depends_on "python@3.13"

  def install
    # no runtime dependencies; pip fetches the build backend (hatchling) in an isolated build environment
    virtualenv_install_with_resources
  end

  test do
    assert_match "compactlab #{version}", shell_output("#{bin}/compactlab --version")
    ENV["HOME"] = testpath # the demo reads bundled synthetic data only; keep any state out of the real home
    system bin/"compactlab", "demo", "--out", testpath/"demo", "--no-open", "--lang", "en"
    assert_path_exists testpath/"demo/report.html"
    assert_match "\"kind\":\"hello\"", shell_output("#{bin}/compactlab engine hello")
  end
end
