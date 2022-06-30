class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "2.4.1"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "dd8048bff76b2d24dc9df3de4ba1661d9cd08a33410c7099389c0d5ed220731f"
    url "https://github.com/okteto/okteto/releases/download/2.4.1/okteto-Darwin-arm64"
  else
    sha256 "586a458e84fedbea9c37b2396d06f824a1017b7544fe957e29b58e82bca8b205"
    url "https://github.com/okteto/okteto/releases/download/2.4.1/okteto-Darwin-x86_64"
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
      assert_match "okteto version 2.4.1", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
