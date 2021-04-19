class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "1.12.8"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "3b0b3ca8c72f0d855dbba8d06acc3f237ac23428e49376d90fbd7d10840f9c94"
    url "https://github.com/okteto/okteto/releases/download/1.12.8/okteto-Darwin-arm64"
  else
    sha256 "8ae410d4a163812121085947c4be536ec68757072e930ef678305688e3837629"
    url "https://github.com/okteto/okteto/releases/download/1.12.8/okteto-Darwin-x86_64"
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
      assert_match "okteto version 1.12.8", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
