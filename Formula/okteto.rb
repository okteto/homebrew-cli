class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "3.22.0"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "319eafc0dfe5c4e0252bf536c45b57e91d9e11abea2c5bb10fa126a1e9df21cb"
    url "https://github.com/okteto/okteto/releases/download/3.22.0/okteto-Darwin-arm64"
  else
    sha256 "240c52d7c6ccb088e38fb743ce522d975dea2bb78ce0e3d82540c0275f111750"
    url "https://github.com/okteto/okteto/releases/download/3.22.0/okteto-Darwin-x86_64"
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
      assert_match "okteto version 3.22.0", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
