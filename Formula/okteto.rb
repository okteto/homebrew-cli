class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "2.30.2"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "f5b39ed39d21d2378b192e37aa80f1f59a7b6673d0ae687ff0799623748ae38f"
    url "https://github.com/okteto/okteto/releases/download/2.30.2/okteto-Darwin-arm64"
  else
    sha256 "5cda170e698d7f8cbe03ca5d0ff54daff99adc0e4629d3fae983bcc5b11abada"
    url "https://github.com/okteto/okteto/releases/download/2.30.2/okteto-Darwin-x86_64"
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
      assert_match "okteto version 2.30.2", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
