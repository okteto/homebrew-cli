class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "3.17.1"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "b951f0ff1d303774ab189ed1c6e4b7681ba5590c9087859691adb7add9d6a601"
    url "https://github.com/okteto/okteto/releases/download/3.17.1/okteto-Darwin-arm64"
  else
    sha256 "18acf9187e9f675c28c0043bfcff282e5576803b5e5ce9d5e8bde29360f97c81"
    url "https://github.com/okteto/okteto/releases/download/3.17.1/okteto-Darwin-x86_64"
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
      assert_match "okteto version 3.17.1", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
