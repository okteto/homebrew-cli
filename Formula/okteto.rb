class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "2.4.2"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "522775423117c5e79727841df2299e0371d95b49ac71f7ec4696df88dddf29a1"
    url "https://github.com/okteto/okteto/releases/download/2.4.2/okteto-Darwin-arm64"
  else
    sha256 "059aef0fe4b962ab0da731a870e0bf85063d5c1c2c31fb4fb7760ec740a2e34a"
    url "https://github.com/okteto/okteto/releases/download/2.4.2/okteto-Darwin-x86_64"
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
      assert_match "okteto version 2.4.2", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
