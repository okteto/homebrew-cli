class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "1.14.9"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "9cce0864bd1e129fb3db3069646c4e7d291b9a34263ac3d384afa0c0df20dd68"
    url "https://github.com/okteto/okteto/releases/download/1.14.9/okteto-Darwin-arm64"
  else
    sha256 "ddc3d62366af06dea61f3143eadd29d32b48ee34ea9c3afdc622f85fec5a85a5"
    url "https://github.com/okteto/okteto/releases/download/1.14.9/okteto-Darwin-x86_64"
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
      assert_match "okteto version 1.14.9", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
