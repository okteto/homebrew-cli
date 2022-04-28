class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "2.2.1"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "87907baa7585717ea8345c83f9e78292ff25c4a982609d8e9567517256c04fc0"
    url "https://github.com/okteto/okteto/releases/download/2.2.1/okteto-Darwin-arm64"
  else
    sha256 "382b9debbc31ece6c000398d34c74a476f00d66cdb9eb56b31d727836deb5f65"
    url "https://github.com/okteto/okteto/releases/download/2.2.1/okteto-Darwin-x86_64"
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
      assert_match "okteto version 2.2.1", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
