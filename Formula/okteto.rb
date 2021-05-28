class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "1.12.14"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "fdb1cb57b151543f1daf4cc888ef4a96cae8cff995b83870e99c1593bb8e785e"
    url "https://github.com/okteto/okteto/releases/download/1.12.14/okteto-Darwin-arm64"
  else
    sha256 "319588e46b470a07aa68384529e9ef2a18879daaabe7083d2e8e1e5d57d3b95a"
    url "https://github.com/okteto/okteto/releases/download/1.12.14/okteto-Darwin-x86_64"
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
      assert_match "okteto version 1.12.14", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
