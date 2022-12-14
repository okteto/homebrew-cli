class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "2.10.2"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "64b093b34f12a0cd88beb8c26b40c74f5c0b1c1d1a7e43ccb7b6d713e147aac9"
    url "https://github.com/okteto/okteto/releases/download/2.10.2/okteto-Darwin-arm64"
  else
    sha256 "1237ba8ecd15f00e1287758ab19cd33297ba8378fd0773433be114de9f2d1de2"
    url "https://github.com/okteto/okteto/releases/download/2.10.2/okteto-Darwin-x86_64"
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
      assert_match "okteto version 2.10.2", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
