class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "1.12.9"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "9b8129fc889282f552b78e8b6959c33c9cd841218fd7cdc73057db860fd45a09"
    url "https://github.com/okteto/okteto/releases/download/1.12.9/okteto-Darwin-arm64"
  else
    sha256 "a41afbb55ef7cf0e99f48848c916cc542022c440e0828cac81a95ea7041c23dc"
    url "https://github.com/okteto/okteto/releases/download/1.12.9/okteto-Darwin-x86_64"
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
      assert_match "okteto version 1.12.9", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
