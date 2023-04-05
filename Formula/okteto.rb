class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "2.14.2"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "c543e78501c22ab9cd0f6fdae16e6008eaf6a760f52a77ddbbd5268cdccb6785"
    url "https://github.com/okteto/okteto/releases/download/2.14.2/okteto-Darwin-arm64"
  else
    sha256 "9ace095171b1fcaf402c9ad8680082ef5e0be1a922a515cee2c999777916747b"
    url "https://github.com/okteto/okteto/releases/download/2.14.2/okteto-Darwin-x86_64"
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
      assert_match "okteto version 2.14.2", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
