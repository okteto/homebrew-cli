class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "3.13.4"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "5c90c3447e8a6c31aef13f7cf8c6c05667bad1ee78c314fff0b950c3b6fb20e3"
    url "https://github.com/okteto/okteto/releases/download/3.13.4/okteto-Darwin-arm64"
  else
    sha256 "3cdc6764b8faaef82a01f5678e68a3648a0b6a21e0d7dcc2e11c896e6defd2d3"
    url "https://github.com/okteto/okteto/releases/download/3.13.4/okteto-Darwin-x86_64"
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
      assert_match "okteto version 3.13.4", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
