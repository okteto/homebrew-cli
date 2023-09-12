class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "2.20.0"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "ba7cc3e0dc99058a14c11e4de0e531dc2a713f828f87041bb4d2b79b989f7d7f"
    url "https://github.com/okteto/okteto/releases/download/2.20.0/okteto-Darwin-arm64"
  else
    sha256 "e4c8ae8c379917b0c7abb41378910f14ac8c73cf2128950e478de7d86a92b454"
    url "https://github.com/okteto/okteto/releases/download/2.20.0/okteto-Darwin-x86_64"
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
      assert_match "okteto version 2.20.0", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
