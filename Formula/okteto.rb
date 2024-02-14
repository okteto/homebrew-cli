class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "2.25.2"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "ba2912d854680a36de211b5b8cea4584ed23df2d8786f3cc768e2582d7d3747d"
    url "https://github.com/okteto/okteto/releases/download/2.25.2/okteto-Darwin-arm64"
  else
    sha256 "f1b4b570422d0bf16e436df784812b596079e810b02591fdee022bcd24d74215"
    url "https://github.com/okteto/okteto/releases/download/2.25.2/okteto-Darwin-x86_64"
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
      assert_match "okteto version 2.25.2", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
