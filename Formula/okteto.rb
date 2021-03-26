class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "1.12.1"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "edd52a1d49f590bc4605f40984a04426adf615f44d8731c834d5e950fc268a4c"
    url "https://github.com/okteto/okteto/releases/download/1.12.1/okteto-Darwin-arm64"
  else
    sha256 "ca1cf56bc58d801f7553566a1acc47126de4200b4ac22cb3bebbe82b5064bcfd"
    url "https://github.com/okteto/okteto/releases/download/1.12.1/okteto-Darwin-x86_64"
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
      assert_match "okteto version 1.12.1", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
