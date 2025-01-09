class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "3.3.0"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "1928bbe893cf6a6b2533dbbf888ff5512c412b954fa12d2d661579891d1049e9"
    url "https://github.com/okteto/okteto/releases/download/3.3.0/okteto-Darwin-arm64"
  else
    sha256 "6b998b96a992be9d81e7176ab8d9dacd76b8c5426f8bbcb8699fe2ba2b47eecf"
    url "https://github.com/okteto/okteto/releases/download/3.3.0/okteto-Darwin-x86_64"
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
      assert_match "okteto version 3.3.0", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
