class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "2.5.2"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "1062720fa4fe1f4f7285f1f7611dd92e9a4822dfbe2f61869b6148e883982406"
    url "https://github.com/okteto/okteto/releases/download/2.5.2/okteto-Darwin-arm64"
  else
    sha256 "38348b53ad5cbc6add2f78645f3432e456299fe727b44d7d37fc7f18569fedfc"
    url "https://github.com/okteto/okteto/releases/download/2.5.2/okteto-Darwin-x86_64"
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
      assert_match "okteto version 2.5.2", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
