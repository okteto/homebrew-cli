class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "2.21.0"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "b31243abb1afef097b066c0d80d2ec128fec7be6c738140eeab316f5657363c3"
    url "https://github.com/okteto/okteto/releases/download/2.21.0/okteto-Darwin-arm64"
  else
    sha256 "74734743e2fb0a62218aef9d985963f451d7f65142242d18a88f40124f0f7ccf"
    url "https://github.com/okteto/okteto/releases/download/2.21.0/okteto-Darwin-x86_64"
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
      assert_match "okteto version 2.21.0", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
