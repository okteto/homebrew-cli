class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "2.13.0"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "204cd59f09adfda339de755b4ca6e871caae5e7062c72c74eeb8d407eb7c3ee4"
    url "https://github.com/okteto/okteto/releases/download/2.13.0/okteto-Darwin-arm64"
  else
    sha256 "f5ec83831162f9ba3ebda62e7bbe690d16c9471979030e6d2aa7c41407122f74"
    url "https://github.com/okteto/okteto/releases/download/2.13.0/okteto-Darwin-x86_64"
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
      assert_match "okteto version 2.13.0", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
