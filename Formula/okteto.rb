class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "2.23.3"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "66e3116bdab2d28de1870f0813a79ed17dc042363dacde820c36da54b985af30"
    url "https://github.com/okteto/okteto/releases/download/2.23.3/okteto-Darwin-arm64"
  else
    sha256 "46a09c2daf921b17943bf65f26c2bce07968fb8aa957aea5728a76b3ef8ab62a"
    url "https://github.com/okteto/okteto/releases/download/2.23.3/okteto-Darwin-x86_64"
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
      assert_match "okteto version 2.23.3", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
