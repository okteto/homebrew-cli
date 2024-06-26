class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "2.28.1"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "8d16629b2775f5a49ba1d6d79cc85e8fb0e0f330fbc6818858f81a8ab34144b3"
    url "https://github.com/okteto/okteto/releases/download/2.28.1/okteto-Darwin-arm64"
  else
    sha256 "6dfac631ba951e76702572e4f8eabe1bb56be17a3f8899912cd220f3fb08691b"
    url "https://github.com/okteto/okteto/releases/download/2.28.1/okteto-Darwin-x86_64"
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
      assert_match "okteto version 2.28.1", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
