class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "2.27.2"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "c5813291ab70fbc6b5afef430a9b31a3e5a7a025afccca1f634d96e9aff54b75"
    url "https://github.com/okteto/okteto/releases/download/2.27.2/okteto-Darwin-arm64"
  else
    sha256 "ad9f3fc456596d7718db66400ed0fc284baf74794ef913606ca4f55f4acc8d3d"
    url "https://github.com/okteto/okteto/releases/download/2.27.2/okteto-Darwin-x86_64"
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
      assert_match "okteto version 2.27.2", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
