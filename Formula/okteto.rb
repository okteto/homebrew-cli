class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "1.13.1"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "b8b01a7ce419ea8c4e74d1144f8b0cb4f930a7bfc87a054a77767b24c8ed0d80"
    url "https://github.com/okteto/okteto/releases/download/1.13.1/okteto-Darwin-arm64"
  else
    sha256 "ee8d81e18556efe39d0bd5cebc4bfbbe9b9782fe1dc6778230b1f238bcd72104"
    url "https://github.com/okteto/okteto/releases/download/1.13.1/okteto-Darwin-x86_64"
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
      assert_match "okteto version 1.13.1", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
