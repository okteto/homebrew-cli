class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "1.13.3"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "94645377fa159f0f6a2d34f687640840976a2872eab2deec816f11e90f54ca66"
    url "https://github.com/okteto/okteto/releases/download/1.13.3/okteto-Darwin-arm64"
  else
    sha256 "f32b4121e0acecb528f6039b728da975794f48c9a576145078e9afa0eac22bad"
    url "https://github.com/okteto/okteto/releases/download/1.13.3/okteto-Darwin-x86_64"
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
      assert_match "okteto version 1.13.3", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
