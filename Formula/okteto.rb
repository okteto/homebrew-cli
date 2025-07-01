class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "3.9.0"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "d7585c8b16e0c2b7ad05283fab946506f5ae4951fde7896cc52931e420b545bb"
    url "https://github.com/okteto/okteto/releases/download/3.9.0/okteto-Darwin-arm64"
  else
    sha256 "8b3dc5edf4a73123bb62ae2facb0da2dcb9c8586beeb95173a3e63601bb07911"
    url "https://github.com/okteto/okteto/releases/download/3.9.0/okteto-Darwin-x86_64"
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
      assert_match "okteto version 3.9.0", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
