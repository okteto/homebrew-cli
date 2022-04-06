class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "2.1.0"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "76c03c1abfb5b6857d3f933bbf3f28021a574b14db9e34f954be8ad7fc1bc672"
    url "https://github.com/okteto/okteto/releases/download/2.1.0/okteto-Darwin-arm64"
  else
    sha256 "20c54d1224b9f0f9ec2f90b7af10bd2c60b9c2a74f1964a4d3ba8f67551b7ae8"
    url "https://github.com/okteto/okteto/releases/download/2.1.0/okteto-Darwin-x86_64"
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
      assert_match "okteto version 2.1.0", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
