class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "3.3.1"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "778b4b92ad3acec064904de7bb900acfb9c0ef8097a4a0907cb5c1a1480b29d7"
    url "https://github.com/okteto/okteto/releases/download/3.3.1/okteto-Darwin-arm64"
  else
    sha256 "85fbc7b1bf5b390e7e1f8bde1026133ab4a22455afb067a2adc5b35a211f0767"
    url "https://github.com/okteto/okteto/releases/download/3.3.1/okteto-Darwin-x86_64"
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
      assert_match "okteto version 3.3.1", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
