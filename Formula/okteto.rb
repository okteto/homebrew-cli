class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "2.22.3"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "58b9954ab2989c0abbab0060c7e18f8969516d3c9aaae00e9155406d56a053db"
    url "https://github.com/okteto/okteto/releases/download/2.22.3/okteto-Darwin-arm64"
  else
    sha256 "c7f317cd4f3765739c9fca7537dbd356bd6b01be15a40cefa6392ea0038d03c9"
    url "https://github.com/okteto/okteto/releases/download/2.22.3/okteto-Darwin-x86_64"
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
      assert_match "okteto version 2.22.3", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
