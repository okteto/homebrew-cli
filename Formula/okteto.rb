class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "1.13.2"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "233f23deec3d6b4089c8f1d9600f9400058162d6431284cb3402737a891fac82"
    url "https://github.com/okteto/okteto/releases/download/1.13.2/okteto-Darwin-arm64"
  else
    sha256 "44fc0912cdf544132f1b9c0121908b0f5d7493d5f841a2eb1696e4c4d7d2c096"
    url "https://github.com/okteto/okteto/releases/download/1.13.2/okteto-Darwin-x86_64"
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
      assert_match "okteto version 1.13.2", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
