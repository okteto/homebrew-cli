class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "2.10.1"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "52a325b049d151e40640404a26dd4b01aed809d7a7d813681375b98e18d1ac57"
    url "https://github.com/okteto/okteto/releases/download/2.10.1/okteto-Darwin-arm64"
  else
    sha256 "84e0151ebc468aab2e7faf885b213bde27a38794c2cafa6528d7fd9b1e8ab53f"
    url "https://github.com/okteto/okteto/releases/download/2.10.1/okteto-Darwin-x86_64"
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
      assert_match "okteto version 2.10.1", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
