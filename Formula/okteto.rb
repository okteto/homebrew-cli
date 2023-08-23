class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "2.19.1"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "d59afd5b97dd9f03e095eeec82e172f17910750e3459b797efd1b8bf838e1ad5"
    url "https://github.com/okteto/okteto/releases/download/2.19.1/okteto-Darwin-arm64"
  else
    sha256 "87700469d7e6a51a688a9a603046609f30e4a0f3e0580181879e35b8a6215b38"
    url "https://github.com/okteto/okteto/releases/download/2.19.1/okteto-Darwin-x86_64"
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
      assert_match "okteto version 2.19.1", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
