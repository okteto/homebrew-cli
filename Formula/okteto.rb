class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "1.14.2"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "e4d3c611475fba309465cc8a2bfef10d273ac0a13cbb44cdfa443bb83f22a4e9"
    url "https://github.com/okteto/okteto/releases/download/1.14.2/okteto-Darwin-arm64"
  else
    sha256 "1971d8a057c8e3bc334f0f8b932335d9319d1609fcdb9ae00a901eadd33985ad"
    url "https://github.com/okteto/okteto/releases/download/1.14.2/okteto-Darwin-x86_64"
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
      assert_match "okteto version 1.14.2", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
