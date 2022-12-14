class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "2.10.2"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "57c1ff6784bf30825373bbd4ca9348a9083dd4df00d9019f34c824f23275dc6d"
    url "https://github.com/okteto/okteto/releases/download/2.10.2/okteto-Darwin-arm64"
  else
    sha256 "58d1b04d88be9b30a0e0dd48b9cb20f00bc52888ac99ee0bf2016ce66a196aab"
    url "https://github.com/okteto/okteto/releases/download/2.10.2/okteto-Darwin-x86_64"
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
      assert_match "okteto version 2.10.2", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
