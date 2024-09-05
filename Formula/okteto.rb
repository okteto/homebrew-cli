class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "2.31.0"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "72b5f0fb5ff7580c0d10f1c1baa15ce3300da46957e349321c3091b43171ae32"
    url "https://github.com/okteto/okteto/releases/download/2.31.0/okteto-Darwin-arm64"
  else
    sha256 "1035de2bf7883690db7268d7e585ba3893c37aa03d35fa5b8cb7c5854f1ed8ea"
    url "https://github.com/okteto/okteto/releases/download/2.31.0/okteto-Darwin-x86_64"
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
      assert_match "okteto version 2.31.0", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
