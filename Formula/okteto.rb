class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "2.25.0"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "bcfde377ca070ae9b17e66981a87192b2addf26fc96a96d42e40027fb23dfc1e"
    url "https://github.com/okteto/okteto/releases/download/2.25.0/okteto-Darwin-arm64"
  else
    sha256 "fa354fc5b95affd5d2200f4fce46a64cad6d252309bae7355ddd064eb318af0e"
    url "https://github.com/okteto/okteto/releases/download/2.25.0/okteto-Darwin-x86_64"
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
      assert_match "okteto version 2.25.0", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
