class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "1.12.6"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "939cd9c597698c376b8f74e91ec5964bd29b67a2f9ebfdb62949d1a76e970885"
    url "https://github.com/okteto/okteto/releases/download/1.12.6/okteto-Darwin-arm64"
  else
    sha256 "4275ec6a18f8cef2dd13da64c2314f5011d365256613d151cd94c4d5c86aa001"
    url "https://github.com/okteto/okteto/releases/download/1.12.6/okteto-Darwin-x86_64"
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
      assert_match "okteto version 1.12.6", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
