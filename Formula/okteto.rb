class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "3.10.0"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "28b15383e65a5999be56bfc86a56853c85a3bca4ee766ac4a8b573292a957a2e"
    url "https://github.com/okteto/okteto/releases/download/3.10.0/okteto-Darwin-arm64"
  else
    sha256 "b4b2e3009886c01057749667c5897107b94088097bec4c3fa4efdc1b5d9b6236"
    url "https://github.com/okteto/okteto/releases/download/3.10.0/okteto-Darwin-x86_64"
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
      assert_match "okteto version 3.10.0", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
