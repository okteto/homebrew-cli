class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "2.14.0"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "bfb0c6dc1807562877b652b8370036b1585317bd47671b8e5f17508916dc1d12"
    url "https://github.com/okteto/okteto/releases/download/2.14.0/okteto-Darwin-arm64"
  else
    sha256 "c5fd3b9d469c1d4c04242e1330af91902675f9c567fb4ad01f568aed45a94b26"
    url "https://github.com/okteto/okteto/releases/download/2.14.0/okteto-Darwin-x86_64"
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
      assert_match "okteto version 2.14.0", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
