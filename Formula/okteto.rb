class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "2.4.0"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "67f3dc985439fa647de3d19e867d015318e4e92586602c368129437a6ced680f"
    url "https://github.com/okteto/okteto/releases/download/2.4.0/okteto-Darwin-arm64"
  else
    sha256 "f917361f2c0afe3bfb8fdca85c95251d57ca82de506c81541cf98dd0eb6e1669"
    url "https://github.com/okteto/okteto/releases/download/2.4.0/okteto-Darwin-x86_64"
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
      assert_match "okteto version 2.4.0", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
