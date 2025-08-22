class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "3.10.1"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "cba6913607165403d8e8b34209ac4cdcdb7bf22a8eb114aead3b20d4b383d5a7"
    url "https://github.com/okteto/okteto/releases/download/3.10.1/okteto-Darwin-arm64"
  else
    sha256 "3eb2e25c1c20302f379a64a18036216a9f43387ab9bd89133ee29d0e154fc029"
    url "https://github.com/okteto/okteto/releases/download/3.10.1/okteto-Darwin-x86_64"
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
      assert_match "okteto version 3.10.1", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
