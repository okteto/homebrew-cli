class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "1.14.0"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "95a00ca0ef10ef8fcf92e6b2796c712f378a0f994ac877606cf066a3f6a7ae13"
    url "https://github.com/okteto/okteto/releases/download/1.14.0/okteto-Darwin-arm64"
  else
    sha256 "552f6ecfc319b2079e0ff878ff0731026ba024ce707964740018d402a89a9c59"
    url "https://github.com/okteto/okteto/releases/download/1.14.0/okteto-Darwin-x86_64"
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
      assert_match "okteto version 1.14.0", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
