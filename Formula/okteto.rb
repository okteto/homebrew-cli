class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "3.13.1"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "f6d825836e2f0c28b434e4670c26efc7b39e98faf8e165474c89872419ec5d0d"
    url "https://github.com/okteto/okteto/releases/download/3.13.1/okteto-Darwin-arm64"
  else
    sha256 "8422b3cb1888b836bb1d33516f57de15f8829ee4c1acb5684afe359373c6ae85"
    url "https://github.com/okteto/okteto/releases/download/3.13.1/okteto-Darwin-x86_64"
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
      assert_match "okteto version 3.13.1", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
