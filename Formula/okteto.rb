class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "2.8.1"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "f153ce75293e23c4bb1a8f02610ed03ac6633768c56a6bb383dac1fdff2a08ab"
    url "https://github.com/okteto/okteto/releases/download/2.8.1/okteto-Darwin-arm64"
  else
    sha256 "89e14acae0763f16c1077d280e123a0ce1634168cbeef4401a3970097047c413"
    url "https://github.com/okteto/okteto/releases/download/2.8.1/okteto-Darwin-x86_64"
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
      assert_match "okteto version 2.8.1", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
