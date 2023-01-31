class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "2.12.0"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "3011a30c292a3ea7c512b79078e7b5428eaeca58c598e209ad73c4205a3f47d7"
    url "https://github.com/okteto/okteto/releases/download/2.12.0/okteto-Darwin-arm64"
  else
    sha256 "bce7489db1f6d820998e9f1e38a9d3fab6b39e88e93f752f42c31fbfd23bed09"
    url "https://github.com/okteto/okteto/releases/download/2.12.0/okteto-Darwin-x86_64"
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
      assert_match "okteto version 2.12.0", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
