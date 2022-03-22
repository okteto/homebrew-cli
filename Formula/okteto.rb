class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "2.0.1"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "4e498cb20fb82d355adc6f67149d71ca4c2720af091a26c99ebc2e6f961c0335"
    url "https://github.com/okteto/okteto/releases/download/2.0.1/okteto-Darwin-arm64"
  else
    sha256 "f9bb6f5df0916e9c5b0265630faa411067dc2e2d3512f3be96cc0c4af66b9b66"
    url "https://github.com/okteto/okteto/releases/download/2.0.1/okteto-Darwin-x86_64"
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
      assert_match "okteto version 2.0.1", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
