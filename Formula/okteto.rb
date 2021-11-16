class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "1.14.6"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "800ada73bab4670600c8b77489023d0a98ba93ebc99a843ce8f1c6a4d7b36873"
    url "https://github.com/okteto/okteto/releases/download/1.14.6/okteto-Darwin-arm64"
  else
    sha256 "598d192e5811a716b736f13088659bc75da48710237027de12423c2985f2650d"
    url "https://github.com/okteto/okteto/releases/download/1.14.6/okteto-Darwin-x86_64"
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
      assert_match "okteto version 1.14.6", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
