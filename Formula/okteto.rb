class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "2.22.1"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "be854d63e401cfa95226e81b7bbea718d2862c5d43252c59882eb57a5e908059"
    url "https://github.com/okteto/okteto/releases/download/2.22.1/okteto-Darwin-arm64"
  else
    sha256 "3b653e923f4539ae82e0e2690bc6245c38de5780921b824ce822e4d31bb665f6"
    url "https://github.com/okteto/okteto/releases/download/2.22.1/okteto-Darwin-x86_64"
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
      assert_match "okteto version 2.22.1", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
