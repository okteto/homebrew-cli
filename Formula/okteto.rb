class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "3.12.0"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "1554533c0eb40b4b4f4ef05b0311cc28f15be6ac38894d72e5c105ccb3cf8e46"
    url "https://github.com/okteto/okteto/releases/download/3.12.0/okteto-Darwin-arm64"
  else
    sha256 "33bb60143b4161083d9bc24d77c01e53ab9aa98b49f28bbd1633f784fafddf27"
    url "https://github.com/okteto/okteto/releases/download/3.12.0/okteto-Darwin-x86_64"
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
      assert_match "okteto version 3.12.0", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
