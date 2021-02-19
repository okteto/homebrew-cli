class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "1.10.9"
  license "Apache-2.0"
  
  if Hardware::CPU.arm?
    sha256 "10797a7a9b6d5ab3cb591062dab8586e190f1c229678d5dac9d6ed2e5366ac32"
    url "https://github.com/okteto/okteto/releases/download/1.10.9/okteto-Darwin-arm64"
  else
    sha256 "7e4fec9ac04e58facfdd7c063a14a2136e5589a1854def4a753fe91991304ef4"
    url "https://github.com/okteto/okteto/releases/download/1.10.9/okteto-Darwin-x86_64"
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
      assert_match "okteto version 1.10.9", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
