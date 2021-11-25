class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "1.14.8"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "5973fae294d41b89c02a0472e9bc31e6db1ee3c918e09e4fe39c6611848400ca"
    url "https://github.com/okteto/okteto/releases/download/1.14.8/okteto-Darwin-arm64"
  else
    sha256 "c69bea6ca5b10ece8d900a87185af7a19c71d45ae6c2e3f1706ff3242b882a2a"
    url "https://github.com/okteto/okteto/releases/download/1.14.8/okteto-Darwin-x86_64"
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
      assert_match "okteto version 1.14.8", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
