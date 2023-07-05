class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "2.17.0"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "0cf32b5f828ad2b70641976e48faf6348e4bbcd657568e1c428c449277ee1faf"
    url "https://github.com/okteto/okteto/releases/download/2.17.0/okteto-Darwin-arm64"
  else
    sha256 "b62f747d9ed8e069ceacb27e90a00fe6c80ffc345594f4e99861de0fc63dddcf"
    url "https://github.com/okteto/okteto/releases/download/2.17.0/okteto-Darwin-x86_64"
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
      assert_match "okteto version 2.17.0", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
