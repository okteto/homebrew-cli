class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "1.15.3"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "999e995b9f85d863c0b9c1b2aa5fd18eb265c65460fddfea574ad27b827f7d47"
    url "https://github.com/okteto/okteto/releases/download/1.15.3/okteto-Darwin-arm64"
  else
    sha256 "5c7e05020d2ce0458d78a06e98ca07240a1c61915de0848eae80b9cd36a20afa"
    url "https://github.com/okteto/okteto/releases/download/1.15.3/okteto-Darwin-x86_64"
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
      assert_match "okteto version 1.15.3", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
