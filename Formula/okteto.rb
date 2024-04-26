class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "2.26.1"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "7557ee0e0a4fa79af933e188d84090f4d8c0d416d7f2d3ee17ec17cce497cbac"
    url "https://github.com/okteto/okteto/releases/download/2.26.1/okteto-Darwin-arm64"
  else
    sha256 "b1f3024f054fea54218c0ae3744773e4565c3f721800f72503c4e7ba6225b621"
    url "https://github.com/okteto/okteto/releases/download/2.26.1/okteto-Darwin-x86_64"
  end

  head do
    if Hardware::CPU.arm?
      url "https://downloads.okteto.com/cli/master/okteto-Darwin-arm64"
    else
      url "https://downloads.okteto.com/cli/master/okteto-Darwin-x86_64"
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install "okteto-Darwin-arm64"
      mv bin/"okteto-Darwin-arm64", bin/"okteto"
    else
      bin.install "okteto-Darwin-x86_64"
      mv bin/"okteto-Darwin-x86_64", bin/"okteto"
    end
  end

  # Homebrew requires tests.
  test do
      assert_match "okteto version 2.26.1", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
