class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "1.15.4"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "393a5e4ca3be99ae7a1d14b5842fae07c1974d037e32649bc58f5b8f4a2faf13"
    url "https://github.com/okteto/okteto/releases/download/1.15.4/okteto-Darwin-arm64"
  else
    sha256 "99d188b5ee80d348eb21dc07368d771d68da7498a47ca0a38dcf8ae2b9406693"
    url "https://github.com/okteto/okteto/releases/download/1.15.4/okteto-Darwin-x86_64"
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
      assert_match "okteto version 1.15.4", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
