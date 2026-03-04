class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "3.17.0"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "333b2153de079446e7c4bdab16e2974ef766662b07e7a3c8f3ead419be266af6"
    url "https://github.com/okteto/okteto/releases/download/3.17.0/okteto-Darwin-arm64"
  else
    sha256 "be9c2b365f619b8c76d4473951f64b9c0da118bf2433518016f3d9c9e54da80d"
    url "https://github.com/okteto/okteto/releases/download/3.17.0/okteto-Darwin-x86_64"
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
      assert_match "okteto version 3.17.0", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
