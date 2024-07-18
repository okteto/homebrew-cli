class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "2.29.2"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "d547efe0210abc8f34802d78c2422eee490aadc940e8ed161ad3c4dae42f9543"
    url "https://github.com/okteto/okteto/releases/download/2.29.2/okteto-Darwin-arm64"
  else
    sha256 "5ba675b277f1f47153fb493841713f045e774fce459a70ab0c14069e0a392dfe"
    url "https://github.com/okteto/okteto/releases/download/2.29.2/okteto-Darwin-x86_64"
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
      assert_match "okteto version 2.29.2", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
